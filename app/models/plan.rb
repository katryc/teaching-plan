class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :profile
end
