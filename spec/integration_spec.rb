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

    let(:dictionary) { UrlDictionary.load('dk') }

    it 'raises MissingKeyError for absent keys' do
      expect{dictionary.t 'categories.kittens'}.to raise_error(UrlDictionary::MissingKeyError)
    end

    it 'raises BadValueError for keys pointing to a non-string value' do
      expect{dictionary.t 'categories'}.to raise_error(UrlDictionary::BadValueError)
    end

    it 'responds to translate in addition to t' do
      dictionary.translate('sub_sites.sale').should eql 'kob'
    end

    ['dk', 'se'].each do |site_key|
      it "supports all keys for #{site_key}" do
        dictionary = UrlDictionary.load(site_key)
        dictionary.t 'sub_sites.lease'
        dictionary.t 'sub_sites.sale'
        dictionary.t 'categories.investment_property'
        dictionary.t 'categories.user_property'
        dictionary.t 'categories.lease'
        dictionary.t 'location.office'
        dictionary.t 'location.store'
        dictionary.t 'location.warehouse'
        dictionary.t 'location.location'
        dictionary.t 'property.office'
        dictionary.t 'property.store'
        dictionary.t 'property.warehouse'
        dictionary.t 'property.housing'
        dictionary.t 'providers'
        dictionary.t 'province'
        dictionary.t 'search_agent'
        dictionary.t 'about_us'
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
