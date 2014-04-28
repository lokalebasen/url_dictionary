require 'yaml'
require 'open-uri'

module UrlDictionary
  class Loader

    @@site_cache = {}
    @@data_cache = nil

    class << self

      def load(site_key)
        @@site_cache[site_key.to_s.downcase] ||= load_dictionary(site_key)
      end

      def clear_caches
        @@site_cache = {}
        @@data_cache = nil
      end

      private

      def load_dictionary(site_key)
        if site_data = data[site_key.to_s.downcase]
          UrlDictionary::Dictionary.new(site_data)
        else
          fail ArgumentError, "No dictionary for site_key #{site_key}"
        end
      end

      def data
        @@data_cache ||= load_data_structure
      end

      def load_data_structure
        YAML.load(load_from_data_source)
      end

      def load_from_data_source
        if UrlDictionary::Config.use_local_dictionary?
          load_from_file
        else
          load_from_github
        end
      end

      def load_from_github
        open('https://github.com/lokalebasen/url-dictionary/blob/master/lib/url_dictionary/data.yml').read
      rescue Exception => e
        puts "Oops, couldn't read latest dictionary. Falling back to bundled dictionary file: #{e.message}"
        load_from_file
      end

      def load_from_file
        File.read(path_to_file)
      end

      def path_to_file
        File.join(UrlDictionary.root_path, 'data.yml')
      end

    end

  end
end
