class ReviewsController < ApplicationController
    before_action :find_review, only:[:show, :update, :edit, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]
    def index
        @reviews = list_by
    end

    def show 
    end

    def new
        @review = Review.new
    end

    def create
     
       @review = Review.new(review_params)
       @review.user = current_user
       if @review.save
          flash[:notice] = "Review was saved successfully"
          redirect_to @review
       else

         redirect_to new_review_path
       end

    end

    def edit 
      if @current_user == @review.user
         render :edit
      else 
        redirect_to @review
      end
    end


    def update
       
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy
    end

    private 
    def list_by
        if params[:sort_by_rating]
            @reviews = Review.sort_by_rating
        elsif params[:sort_by_alpha]
            @reviews = Review.sort_by_alpha
        else 
            @reviews = Review.all
        end
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :rating, :user_id, :hospital_id, :healthsystem_id)
    end
    

    def authorize_user
        @review = Review.find(params[:id])
        redirect_to @review unless @current_user == @review.user
    end
end
