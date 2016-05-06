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
  table plan_rows do
      row(0).font_style = :bold
      self.header = false
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

  def plan_rows
    [["WARM UP","INTRO", "DRILL","PRACTICE","GAMES & ACTIVITIES","REVIEW"]] +
    [@plan.warm_up, @plan.intro, @plan.drill, @plan.practice, @plan.gamesandactivities, @plan.review]

end



 def regards_message
   move_down 30
   text "Thank you for using TPplnr #{@plan.user_id}", :indent_paragraphs => 300
 end

end
