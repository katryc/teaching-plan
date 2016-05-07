class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :plans, through: :user
end
