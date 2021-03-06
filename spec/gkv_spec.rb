require 'spec_helper'

describe Gkv do
  let(:db) { Gkv::Database.new }

  def clear_db
    $ITEMS = {}
  end

  before(:each) { clear_db }

#  context "as a gem" do
#    it 'has a version number' do
#      expect(Gkv::VERSION).not_to be nil
#    end
#  end

  context "on set" do
#    it 'sets a key' do
#      db.set('Apples', 10)
#      expect(db.get('Apples')).to eq 10
#    end
#
#    it 'modifies a key' do
#      db.set('Apples', 12)
#      db.set('Apples', 10)
#      expect(db.get('Apples')).to eq 10.0
#    end
#
#    it 'keeps a history of a keys values' do
#      db.set('Pants', 10)
#      db.set('Pants', 'oats')
#      expect(db.get_version(1, 'Pants')).to eq 10
#      expect(db.get_version(2, 'Pants')).to eq 'oats'
#    end
#
#    it 'can return a float type' do
#      db.set('Pants', '10')
#      expect(db.get('Pants')).to eq 10.0
#    end
#
#    it 'can return an integer type' do
#      db.set('Pants', '10')
#      expect(db.get('Pants')).to eq 10
#    end

    context "when saving hashes" do
      it 'deals with ruby 2 hashes' do
        db.set('stuff', {key: "value"})
        res = db.get('stuff')
        desired = {key: 'value'}
        expect(res).to be_an_instance_of Hash
        expect(res).to eq desired
        expect(res.to_s).to eq '{"key"=>"value"}'
      end

      it 'deals with old hash syntax' do
        db.set('stuff', {:key => "value"})
        res = db.get('stuff')
        expect(res).to be_an_instance_of Hash
        expect(res.to_s).to eq '{"key"=>"value"}'
      end

      it 'handles created hash via literals' do
        hash = Hash.new
        hash[:stuff] = 'thing'
        db.set('stuff', hash)
        res = db.get('stuff')
        expect(res).to be_an_instance_of Hash
        expect(res.to_s).to eq '{"stuff"=>"thing"}'
      end

      it 'for some fucked up reason works fine and returns a hash with a string setting it (new hash syntax)' do
        db.set('stuff', '{key: "value"}')
        result = {key: 'value'}
        expect(db.get('stuff')).to eq result
        expect(db.get('stuff').class).to eq Hash
      end

      it 'for some fucked up reason works fine and returns a hash with a string setting it (old hash syntax)' do
        db.set('stuff', '{:key => "value"}')
        result = {key: 'value'}
        expect(db.get('stuff')).to eq result
        expect(db.get('stuff').class).to eq Hash
      end

      it 'for some fucked up reason works fine and returns a hash with a string setting it (string key + val, no sym, new hash)' do
        db.set('stuff', '{"key": "value"}')
        result = {key: 'value'}
        expect(db.get('stuff')).to eq result
        expect(db.get('stuff').class).to eq Hash
      end

      it 'for some fucked up reason works fine and returns a hash with a string setting it (string key + val, no sym, old hash)' do
        db.set('stuff', '{"key" => "value"}')
        result = {key: 'value'}
        expect(db.get('stuff')).to eq result
        expect(db.get('stuff').class).to eq Hash
      end
    end

#    it 'can return an array type' do
#      db.set('favorites', ['pants', 'lack of pants', 'party pants'])
#      expect(db.get('favorites')).to eq ['pants', 'lack of pants', 'party pants']
#    end
#
#    it 'can return a bool type' do
#      db.set('stuff', true)
#      expect(db.get('stuff')).to eq true
#    end
  end

#  context "on get" do
#    it 'returns the key when a key is set' do
#      expect(db.set('Apples', '10')).to eq 'Apples'
#    end
#
#    it 'can get all stored items' do
#      db.set('ants', 10)
#      db.set('bob', 'pants')
#      db.set('cants', 10)
#      expect(db.all).to eq [{ 'ants': 10 }, { 'bob': 'pants' }, { 'cants': 10 }]
#    end
#  end
end
