class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :name, presence: true
  validates :profile, presence: true
  validates :position, presence: true
  validates :occupation, presence: true
  validates :password, confirmation: true
  # validates :password_confimation, presence: true
  # binding.pry
  has_many :prototypes
  has_many :comments

end