class City < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :country

end
