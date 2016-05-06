class PlansPdf < Prawn::Document

 def initialize(plan, view)
   super()
   @plan = plan
   @view = view
   logo
   text "Your Teaching Plan #{@plan.id}"
 end

def logo
   logopath = "#{Rails.root}/app/assets/images/brand.png"
   image logopath, :width => 197, :height => 91

  end



end
