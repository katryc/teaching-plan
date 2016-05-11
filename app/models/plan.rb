class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :profile

  validate :is_future



  def past?
   start_time && end_time < Date.today
  end
  # validate the future origin of the date
  def is_future
     errors.add("appointment time", "cannot be in the past") if start_time && end_time && past?
  end

  # searchkick text_start: [‘title’], text_start: [‘intro’]

  def self.search(term)
     where("title LIKE ? ", "%#{term}%" )
   end

end
