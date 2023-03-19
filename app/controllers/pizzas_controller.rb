class PizzasController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def index
        pizzas = Pizza.all 
        render json: pizzas, except: [:created_at, :updated_at], include: :restaurants
    end
    
    def show
        pizza = find_pizza
        render json: pizza

    end

    # def create
    #     pizza = Pizza.create!(pizza_params)
    #     render json: pizza, status: :created
    # end

    # def update
    #     pizza = find_pizza
    #     pizza.update!(pizza_params)
    #     render json: pizza, status: :accepted
       
    # end

    # def destroy
    #     pizza = find_pizza
    #     pizza.destroy
    #     head :no_content

    # end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
      

    def pizza_params
        params.permit(:name, :ingredients)
    end

    def find_pizza
        Pizza.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "pizza not found!!!"}, status: :not_found
    end
    
end
