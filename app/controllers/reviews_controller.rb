class ReviewsController < ApplicationController
    before_action :find_review, only:[:show, :update, :edit, :destroy]
    def index
        @reviews = Review.all
    end

    def show 
    end

    def new
        @review = Review.new
    end

    def create
       @review.create(review_params)
        redirect_to @review

    end
    def edit 

    end
    def update
       
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy
    end

    private 
    def find_review
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :rating, :user_id, :hospital_id, :healthsystem_id)
    end
    


end
