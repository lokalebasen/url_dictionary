# UrlDictionary

A library to resolve url segments for sites

### How to use

Get a Dictionary instance for the site you want to use

    dk_dict = UrlDictionary.load('dk')

Check supported methods

    dk_dict.methods
    => [:sub_sites, :categories, :kinds, :province_slug, ... ]

Call some

    dk_dict.province_slug
    => "landsdele"

    dk_dict.kinds.office
    => "kontorlokaler"

### Performance

UrlDictionary loads the latest dictionary data from GitHub upon first load request and caches the data in a class variable for subsequent requests. In case the request fails, UrlDictionary will use the local data source in lib/url_dictionary/data.yml

UrlDictionary can be configured to always use the local data (useful for speeding up specs). Just call the following configuration method before calling UrlDictionary.load

    UrlDictionary::Config.use_local_dictionary!

If you change your mind in the process (pun intended) and want to go back to the default, call this method:

    UrlDictionary::Config.use_remote_dictionary!
