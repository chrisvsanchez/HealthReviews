class Healthsystem < ApplicationRecord
    has_many :reviews
    has_many :hospitals, through: :reviews 
    has_many :locations
end
