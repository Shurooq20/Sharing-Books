class Api::V1::CategoriesController < Api::ApplicationController
  
  before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
        categories = Category.all.order('created_at DESC')
        render json: categories
    end

    def show
      category = Category.find params[:id]
        render json: category.books
    end

    def create
      category = Category.new params.require(:category).permit(:name, :img_url)
      category.user = current_user
        if category.save
           render json: { id: category.id } 
        else
            render(
                json: { errors: category.errors },
                status: 422
            )
        end
    end

    def update
      category = Category.find params[:id]
        if category.update params.require(:category).permit(:name, :img_url)
            render json: category
        else
            render(
                json: { errors: category.errors },
                status: 422
            )
        end
    end

    def destroy
      category = Category.find params[:id]
        if category.destroy
            render(
                json: { destroyed: true },
                status: 200
            )
        else
            render(
                JSON: { destroyed: false },
                status: 422
            )
        end
    end
end

