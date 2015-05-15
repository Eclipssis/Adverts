class Comment < ActiveRecord::Base
  validates :text, :user, :advert, presence: true

  belongs_to :advert
  belongs_to :user
end
