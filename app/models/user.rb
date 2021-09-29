class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_one :profile
  has_many :posts  
  has_many :comments
  has_many :likes
  validates :email, uniqueness: true
  before_validation :change_email

  def change_email
    binding.pry
    self.email = "test-#{User.last.id}@mail.com"
  end
end
