class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :plans, dependent: :destroy
  has_one :profile, dependent: :destroy  
  before_create :build_profile #creates profile at user registration
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }
end
