require 'spec_helper'
require 'version'

describe Version do

  describe 'Happy way' do
    it 'should return new patch version without command param' do
      returned_new_version = Version::upgrade_version('1.0.5')
      expect(returned_new_version).to eq('1.0.6')
    end
  
    it 'should return new patch version with given param' do
      returned_new_version = Version::upgrade_version('1.0.5', 'patch')
      expect(returned_new_version).to eq('1.0.6')
    end
  
    it 'should return new minor version' do
      returned_new_version = Version::upgrade_version('1.1.5', 'minor')
      expect(returned_new_version).to eq('1.2.0')
    end
  
    it 'should return new major version' do
      new_version = Version::upgrade_version('1.0.5', 'major')
      expect(new_version).to eq('2.0.0')
    end
  end
  
  describe 'Wrong way' do
    it 'should not raise an exception' do
      expect {
        Version::upgrade_version(1.0, false)
      }.not_to raise_exception
    end

    it 'should return a valid new version with invalid last param' do
      new_version = Version::upgrade_version(1.0, false)
      expect(new_version).to eq('1.0.1')
    end

    it 'should raise ArgumentError exception when no params given' do
      expect {
        Version::upgrade_version
      }.to raise_exception(ArgumentError)
    end

    it 'should raise Version::InvalidFormat exception when invalid param given' do
      class Blah; end
      expect {
        Version::upgrade_version Blah
      }.to raise_exception(Version::InvalidFormat)
    end
  end
  
end