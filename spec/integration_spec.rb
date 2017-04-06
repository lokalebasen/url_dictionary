require 'spec_helper'

SITE_KEYS = %w(dk se no de at ch pl fi es uk global)

describe UrlDictionary do
  context 'reading keys' do
    let(:dictionary) { UrlDictionary.new('dk') }

    it 'requires existing key' do
      expect { dictionary.t('categories.kittens') }.to raise_error KeyError
    end

    it 'returns some translation successfully' do
      expect(dictionary.translate('sub_sites.sale')).to eq('kob')
    end
  end

  context 'ensure all keys' do
    SITE_KEYS.each do |site_key|
      it "supports all keys for #{site_key}" do
        dictionary = UrlDictionary.new(site_key)
        dictionary.t 'about_us'
        dictionary.t 'all'
        dictionary.t 'categories.investment_property'
        dictionary.t 'categories.user_property'
        dictionary.t 'categories.lot_property'
        dictionary.t 'categories.lease'
        dictionary.t 'energy_rating'
        dictionary.t 'error'
        dictionary.t 'find_business_locations'
        dictionary.t 'floor_plans'
        dictionary.t 'images'
        dictionary.t 'location.office'
        dictionary.t 'location.store'
        dictionary.t 'location.warehouse'
        dictionary.t 'location.location'
        dictionary.t 'newest'
        dictionary.t 'news'
        dictionary.t 'popular'
        dictionary.t 'property.office'
        dictionary.t 'property.store'
        dictionary.t 'property.warehouse'
        dictionary.t 'property.housing'
        dictionary.t 'prospect'
        dictionary.t 'providers'
        dictionary.t 'province'
        dictionary.t 'receipt'
        dictionary.t 'rent_out_business_locations'
        dictionary.t 'sell_business_locations'
        dictionary.t 'search_agent'
        dictionary.t 'services'
        dictionary.t 'sub_sites.lease'
        dictionary.t 'sub_sites.sale'
        dictionary.t 'video_presentation'
      end
    end
  end

end
