class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :profile

  # searchkick text_start: [‘title’], text_start: [‘intro’]

  def self.search(term)
     where("title LIKE ? ", "%#{term}%" )
   end

end
