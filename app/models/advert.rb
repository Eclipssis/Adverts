class Advert < ActiveRecord::Base

  include PgSearch

  validates :title, :text, :user, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  pg_search_scope :search_by_adverts,
                  against: [:title, :text,],
                  associated_against: { user: [:city_id, :login, :fio] }
end
