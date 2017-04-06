# UrlDictionary

A library to resolve url segments for sites

### How to use

    dict = UrlDictionary.new('dk')
    dk_dict.t('province') #=> "landsdele"
    dk_dict.t('location.office') #=> "kontorlokaler"
