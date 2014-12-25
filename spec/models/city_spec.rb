require 'rails_helper'
require 'spec_helper'

RSpec.describe City, :type => :model do

  context "validates" do
    it "Vaild city" do
      @city = City.create(title: 'Sumy')
      @city.should be_valid
    end
  end

  it "Errors must be nil" do
    @city = City.create(title: 'Sumy')
    @city.errors.messages.should be_nil
  end

end
