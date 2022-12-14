class SpicesController < ApplicationController
# GET  spices
    def index
    spices = Spice.all
        render json: spices
    end

# POST  spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

# GET  spices/:id
    def show
        spice = Spice.find_by(id: params[:id])
        render json: spice
    end

# PATCH  spices/:id
    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

# DELETE spices/:id
    def destroy
       spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def error_handling
        render json: {errors: "not found"}, status: :not_found
    end 
end
