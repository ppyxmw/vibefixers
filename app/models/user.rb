class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username,
            presence: true,
            uniqueness: true,
            format: { with: /\A\w{3,20}\z/ }
end
