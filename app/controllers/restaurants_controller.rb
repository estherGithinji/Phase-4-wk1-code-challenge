class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        restaurants = Restaurant.all 
        render json: restaurants, except: [:created_at, :updated_at], include: :pizzas
    end
    
    def show
        restaurant = find_restaurant
        render json: restaurant

    end

    def create
        restaurant = Restaurant.create!(restaurant_params)
        render json: restaurant, status: :created
    end

    def update
        restaurant = find_restaurant
        restaurant.update!(restaurant_params)
        render json: restaurant, status: :accepted
       
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content

    end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
      

    def restaurant_params
        params.permit(:name, :address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "Restaurant not found!!!"}, status: :not_found
    end

end
