module UrlDictionary
  class Dictionary

    def initialize(hash)
      hash.each do |key, value|
        define_singleton_method key do
          if value.is_a? Hash
            UrlDictionary::Dictionary.new(value)
          else
            value
          end
        end
      end
    end

  end
end
