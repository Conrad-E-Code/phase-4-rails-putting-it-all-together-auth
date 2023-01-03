class ApplicationController < ActionController::API
  include ActionController::Cookies
   rescue_from ActiveRecord::RecordInvalid, with: :render_ue
  private

   def render_ue invalid
     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
   end


end
