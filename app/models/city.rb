class City < ActiveRecord::Base
  validates :title, :country, presence: true

  belongs_to :country, inverse_of: :cities
  has_many :users
end
