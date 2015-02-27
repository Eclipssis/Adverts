class Comment < ActiveRecord::Base

  validates :user_id, :advert_id, presence: true

  belongs_to :advert
  belongs_to :user

end