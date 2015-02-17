class Advert < ActiveRecord::Base
  validates :title, :text, :user, presence: true
  belongs_to :user

end
