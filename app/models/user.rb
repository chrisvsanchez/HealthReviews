class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :hospitals, through: :reviews
    
end
