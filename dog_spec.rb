# frozen_string_literal: true

require 'rspec'
require_relative 'dog'

RSpec.describe Dog do
  describe '#bark' do
    it 'returns the "wolf!"' do
      expect(subject.bark).to eql('woof!')
    end
  end

  describe '#feed' do
    context 'When the dog is hungry' do
      subject { described_class.new(hunger_level: 7) }

      it 'is no longer hunger' do
        subject.feed
        expect(subject).to_not be_hungry
      end
    end
  end

  describe '#hungry?' do
    context 'When hunger_level is more then 5' do
      subject { described_class.new(hunger_level: 7) }
      it 'returns true' do
        expect(subject).to be_hungry
      end
    end

    context 'when hunger_level is 5 or less' do
      subject { described_class.new(hunger_level: 5) }
      it 'returns false' do
        expect(subject).to_not be_hungry
      end
    end
  end
end
