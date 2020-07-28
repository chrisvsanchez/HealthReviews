class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  belongs_to :healthsystem
end
