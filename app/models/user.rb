class User < ActiveRecord::Base
  validates :login, :fio, :birthday, :city, presence: true
  has_many :adverts
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
