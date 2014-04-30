# encoding: UTF-8

require 'spec_helper'

describe UrlDictionary do

  before :each do
    UrlDictionary::Config.use_local_dictionary!
  end

  context 'loading a dictionary' do

    it 'should load a dictionary instance for Denmark' do
      UrlDictionary.load('dk').should be_an_instance_of UrlDictionary::Dictionary
    end

    it 'should be indifferent to case' do
      UrlDictionary.load('Dk').should be_an_instance_of UrlDictionary::Dictionary
    end

    it 'should suppport symbols too' do
      UrlDictionary.load(:dk).should be_an_instance_of UrlDictionary::Dictionary
    end

  end

  context 'reading keys' do

    let(:dictionary) {  }

    it 'raises MissingKeyError for absent keys' do
      dictionary = UrlDictionary.load('dk')
      expect{dictionary.get 'categories.kittens'}.to raise_error(UrlDictionary::MissingKeyError)
    end

    it 'raises BadValueError for keys pointing to a non-string value' do
      dictionary = UrlDictionary.load('dk')
      expect{dictionary.get 'categories'}.to raise_error(UrlDictionary::BadValueError)
    end

    ['dk', 'se'].each do |site_key|
      it "supports all keys for #{site_key}" do
        dictionary = UrlDictionary.load(site_key)
        dictionary.get 'sub_sites.lease'
        dictionary.get 'sub_sites.sale'
        dictionary.get 'categories.investment_property'
        dictionary.get 'categories.user_property'
        dictionary.get 'categories.lease'
        dictionary.get 'location.office'
        dictionary.get 'location.store'
        dictionary.get 'location.warehouse'
        dictionary.get 'location.location'
        dictionary.get 'property.office'
        dictionary.get 'property.store'
        dictionary.get 'property.warehouse'
        dictionary.get 'property.housing'
        dictionary.get 'province'
        dictionary.get 'search_agent'
      end
    end

  end

  context 'remote fetching' do

    it 'works with fallback to local dictionary' do
      UrlDictionary::Config.use_remote_dictionary!
      UrlDictionary.load('dk').should be_an_instance_of UrlDictionary::Dictionary
    end

  end

end
