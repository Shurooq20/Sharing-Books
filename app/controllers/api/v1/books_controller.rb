class Api::V1::BooksController < Api::ApplicationController

    before_action :authenticate_user!, only: [:create, :update, :destroy]
    
    def show
        book = Book.find params[:id]
        render json: book
      end

    def index

        books = Book.where(category_id: params[:category_id]).all.order('created_at DESC')
        render json: books
    end

    def create 
        @category = Category.find(params[:category_id])
        @book = Book.new params.require(:book).permit(:title, :author, :link, :description, :img2_url, :rating)
        @book.category = @category
        
        @book.user = current_user
        # byebug
        if @book.save 
            render json: @book
        else 
            @books = @category.books.order(created_at: :desc)
            render(
                json: { errors: @book.errors },
                status: 422
            )
        end
    end

    def update
         book =  Book.find(params[:id])

          if  book.update params.require(:book).permit(:title, :author, :link, :description, :img2_url, :rating)
              render json: book
          else
              render(
                  json: { errors: book.errors },
                  status: 422
              )
          end
      end

    def destroy
        book = Book.find params[:id]
          if book.destroy
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

    def title
        book = Book.find_by(title: params[:title]) 
        # byebug
        render json: book
    end


end