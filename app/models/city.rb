class City < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :country, inverse_of: :city

end
