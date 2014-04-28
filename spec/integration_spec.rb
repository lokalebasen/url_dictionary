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

    it 'raises NoMethodError for absent keys' do
      dictionary = UrlDictionary.load('dk')
      expect{dictionary.categories.kittens}.to raise_error(NoMethodError)
    end

    ['dk', 'se'].each do |site_key|
      it "supports all keys for #{site_key}" do
        dictionary = UrlDictionary.load(site_key)
        dictionary.sub_sites.lease
        dictionary.sub_sites.sale
        dictionary.categories.investment
        dictionary.categories.user
        dictionary.categories.lease
        dictionary.kinds.office
        dictionary.kinds.store
        dictionary.kinds.warehouse
        dictionary.kinds.housing
        dictionary.kinds.all
        dictionary.province_slug
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
