class Api::V1::ReviewsController < Api::ApplicationController

    def index

        reviews = Review.where(book_id: params[:book_id]).all.order('created_at DESC')
        render json: reviews
    end
    
    def create 
        @book = Book.find(params[:book_id])
        # byebug
        @review = Review.new params.require(:review).permit(:body)
        @review.book = @book
        
        @review.user = current_user
        
        if @review.save 
            @reviews = @book.reviews.order(created_at: :desc)
            render json: @reviews
        else 
            render(
                json: { errors: @review.errors },
                status: 422
            )
        end
    end

    def destroy
        review = Review.find params[:id]
          if review.destroy
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