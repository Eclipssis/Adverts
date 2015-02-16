require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do

  context "create with valid fields" do

    subject { User.create login: 'eclipssis', email: 'illia2007@yandex.ru', fio: 'Illya Puchkovskiy', city: 'Sumy', country: 'Ukraine', birthday: '1991-10-12', password: 'secret777' }

    it "should be equal fields" do
      expect(subject.login).to eql('eclipssis')
      expect(subject.email).to eql('illia2007@yandex.ru')
      expect(subject.fio).to eql('Illya Puchkovskiy')
      expect(subject.city).to eql('Sumy')
      expect(subject.country).to eql('Ukraine')
      expect(subject.birthday).to eql('1991-10-12')
    end

    it "should be saved" do
      expect(subject.save).to be true
    end

    it 'should be count errors equals 0' do
      subject.valid?
      expect(subject.errors.size).to eql(0)
    end

  end

  context "create with empty fields" do

    subject { User.create login: '', email: '', fio: '', city: '', country: '', birthday: '', password: '' }

    it 'should not be fields present' do
      expect(subject.login?).to be false
      expect(subject.email?).to be false
      expect(subject.fio?).to be false
      expect(subject.city?).to be false
      expect(subject.country?).to be false
      expect(subject.birthday?).to be false
    end

    it "should not save" do
      expect(subject.save).to be false
    end

    it 'should be count errors equals 6' do
      subject.valid?
      expect(subject.errors.size).to eql(6)
    end
  end
end