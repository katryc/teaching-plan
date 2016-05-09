class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /plans
  # GET /plans.json
def index

  if params[:category].blank?
    @plans = Plan.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @plans = Plan.where(category_id: @category_id).order("created_at DESC")
 end
end

def show
  @plan = Plan.find(params[:id])
  respond_to do |format|
    format.html
    format.pdf do
      pdf = PlansPdf.new(@plan, view_context)
      send_data pdf.render, filename:
      "plan_#{@plan.created_at.strftime("%d-%m-%Y")}.pdf",
      type:"application/pdf"
    end
  end
end

def search
	@plans = Plan.search(params[:query]).paginate(page: params[:page], per_page: 1)
	if request.xhr?
		render :json => @plans.to_json
	else
		render :search
	end
end

def new
  @plan = current_user.plans.build
end

def create
  @plan = current_user.plans.build(plan_params)
  if @plan.save
    redirect_to @plan
  else
    render 'new'

 end
end

def edit
end

def update
 if @plan.update(plan_params)
   redirect_to @plan

else
  render 'edit'
end
end

def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:title, :start_time, :end_time, :warm_up, :intro, :drill, :practice, :gamesandactivities, :review, :category_id)
    end
end
