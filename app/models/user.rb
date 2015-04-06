class User < ActiveRecord::Base
  validates :login, :fio, :birthday, :city, :country, presence: true

  has_many :adverts
  has_many :comments
  belongs_to :role
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_create :create_role

  def admin?
    self.role.try(:name) == 'admin'
  end

  def moderator?
    self.role.try(:name) == 'moderator'
  end

  def user?
    self.role.try(:name) == 'user'
  end

  private

  def create_role
    self.role = Role.find_by_name(:user)
  end

end