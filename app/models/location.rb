class Location < ApplicationRecord
  belongs_to :healthsystem
  has_many :hospitals
end
