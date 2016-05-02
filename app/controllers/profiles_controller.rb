class ProfilesController < ApplicationController
def edit
   @profile = current_user.profile
   @attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
end
end
