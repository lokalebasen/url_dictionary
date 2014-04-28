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

    it 'supports kinds.office' do
      dictionary.kinds.office.should eql 'kontorlokaler'
    end

    it 'supports categories.investment' do
      dictionary.categories.investment.should eql 'investeringsejendomme'
    end

    it 'raises NoMethodError for absent keys' do
      expect{dictionary.categories.kittens}.to raise_error(NoMethodError)
    end

  end

  context 'remote fetching' do

    it 'works with fallback to local dictionary' do
      UrlDictionary::Config.use_remote_dictionary!
      UrlDictionary.load('dk').should be_an_instance_of UrlDictionary::Dictionary
    end

  end

end
