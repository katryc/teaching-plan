class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :plans, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  before_create :build_profile #creates profile at user registration
  validates :username, presence: true, length: { minimum: 3, maximum: 16 }
end
