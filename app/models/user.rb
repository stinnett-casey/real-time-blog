class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :friendships
  has_many :friends, :through => :friendships

  validates_presence_of :first_name, :last_name

  has_one_attached :avatar

  def full_name
    first_name + ' ' + last_name
  end
end
