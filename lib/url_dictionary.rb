require 'yaml'

class UrlDictionary
  VERSION = "0.1.9"

  def initialize(site_key)
    @site_key = site_key.to_s
    @yml = YAML.load(File.read("#{__dir__}/data.yml"))[@site_key]
  end

  def translate(key)
    @yml&.dig(*key.split(".")) || raise(KeyError, "No data found for key #{@site_key}/#{key}")
  end

  alias_method :t, :translate

end
