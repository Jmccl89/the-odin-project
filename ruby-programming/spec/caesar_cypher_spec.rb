require 'spec_helper'
require_relative '../caesar_cypher'

describe 'caesar_cypher' do
  describe '#caesar_cypher' do
    it 'shifts forward by 1' do
      expect(caesar_cypher('hello', 1)).to eq 'ifmmp'
    end
    
    it 'shifts backward by 1' do
      expect(caesar_cypher('hello', -1)).to eq 'gdkkn'
    end
    
    it 'shifts past the beginning of the alphabet' do
      expect(caesar_cypher('wxyz', 2)).to eq 'yzab'
    end
    
    it 'shifts past the beginning of the alphabet' do
      expect(caesar_cypher('abcd', -2)).to eq 'yzab'
    end
    
    it 'maintains capatalization' do
      expect(caesar_cypher('HeLlO', 1)).to eq 'IfMmP'
    end
    
    it 'ignores non-alpha characters' do
      expect(caesar_cypher('Number 1!', 2)).to eq 'Pwodgt 1!'
    end
  end
end
