class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :healthsystem
 

def self.sort_by_rating
    Review.all.sort_by do |review|
      review.rating
    end.reverse
end
def self.sort_by_alpha
    Review.all.sort_by do |review|
      review.hospital.name
    end
end


end
