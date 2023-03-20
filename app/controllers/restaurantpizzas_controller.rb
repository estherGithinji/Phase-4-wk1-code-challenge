class RestaurantpizzasController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        restaurantpizzas = Restaurantpizza.all 
        render json: restaurantpizzas
    end
    
     

    def create
        restaurantpizza = Restaurantpizza.create!(restaurantpizza_params)
        render json: restaurantpizza, status: :created
    end
 
    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
      

    def restaurantpizza_params
        params.permit(:pizza_id, :restaurant_id, :price)
    end

    def find_restaurantpizza
        Restaurantpizza.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "restaurantpizza not found!!!"}, status: :not_found
    end
end