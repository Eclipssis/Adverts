require 'rails_helper'

RSpec.describe Country, :type => :model do

  let(:city) { City.create title: 'first city' }

  context "create with valid fields" do

    subject { Country.create title: 'first country' }

    it 'should be title present' do
      expect(subject.title?).to be true
    end

    it 'should be save' do
      expect(subject.save).to be true
    end

  end

  context "create with empty fields" do

    subject { Country.create title: '' }

    it 'should not be photo present' do
      expect(subject.title?).to be false
    end

    it 'should not be save' do
      expect(subject.save).to be false
    end

    it 'should be count errors equals 1' do
      subject.valid?

      expect(subject.errors.size).to eql(1)
    end

  end

  context "test associations" do

    subject { Country.create title: 'first country' }

    it 'the city should be deleted along with the country' do
      subject.cities.create title: 'first city'
      subject.destroy
      expect(subject.cities.size).to eql(0)
    end
  end
end


