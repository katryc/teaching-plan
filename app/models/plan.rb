class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :profile


  def self.search(term)
     where("title LIKE ? OR intro LIKE ?", "%#{term}%", "%#{term}%" )
   end

end
