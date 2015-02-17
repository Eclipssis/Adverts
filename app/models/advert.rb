class Advert < ActiveRecord::Base
  validates :title, :text, presence: true

end
