require 'rails_helper'
require 'spec_helper'

RSpec.describe City, :type => :model do

  let(:country) { Country.create title: 'first country' }

  context "create with valid fields" do

    subject { country.cities.new title: 'first city' }

    it "should be equal country" do
      expect(subject.country).to eql(country)
    end

    it "should be saved" do
      expect(subject.save).to be true
    end

    it 'should be title present' do
      expect(subject.title?).to be true
    end

  end

  context "create with empty fields" do

    subject { City.new title: '' }

    it 'should not be country present' do
      expect(subject.country).to be_nil
    end

    it 'should not be title present' do
      expect(subject.title?).to be false
    end

    it " should not save" do
      expect(subject.save).to be false
    end

    it 'should be count errors equals 2' do
      subject.valid?

      expect(subject.errors.size).to eql(2)
    end
  end
end
