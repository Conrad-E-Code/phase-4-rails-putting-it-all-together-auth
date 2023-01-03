class RecipesController < ApplicationController
     rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
      user = User.find session[:user_id]
      if user 
        recipes = Recipe.all
        render json: recipes
      else
        render json: {errors: ["YOU MUST LOGIN TO SEE RECIPES"]}, status: :unauthorized
      end
  end

  def create 
    user = User.find_by id: session[:user_id]
    if user  
    recipe = Recipe.create! title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user: user
    render json: recipe, status: :created
     else
       render json: {errors: ["YOU MUST BE LOGGED IN TO POST RECIPES"] }, status: :unauthorized
    end
  end
private
def recipe_params
  params.permit :title, :instructions, :minutes_to_complete
end

 def record_not_found 
   render json: { errors: ["Not found"]}, status: 401
 end

end
