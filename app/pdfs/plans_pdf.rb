class PlansPdf < Prawn::Document

 def initialize(plan, view)
   super()
   @plan = plan
   @view = view
   logo
   title
   time
   body
   regards_message
 end

def logo
   logopath = "#{Rails.root}/app/assets/images/brand.png"
   image logopath, :width => 300, :height => 31

  end

def title
  move_down 30
  text "TITLE: #{@plan.title}"
end

def time
  move_down 10
  text "Lesson time: #{@plan.start_time}  #{@plan.end_time}", :size => 20
end

def body
  move_down 20
  text "Warm Up: #{@plan.warm_up}"
  text "Intro: #{@plan.intro}"
  text "Drill: #{@plan.drill}"
  text "Practice: #{@plan.practice}"
  text "Games and Activities: #{@plan.gamesandactivities}"
  text "Review: #{@plan.review}"
end





 def regards_message
   move_down 30
   text "Thank you for using TPplnr #{@plan.user_id}", :indent_paragraphs => 300
 end

end
