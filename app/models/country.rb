class Country < ActiveRecord::Base
  validates :title, presence: true
  has_many :cities, dependent: :destroy, inverse_of: :country
end

