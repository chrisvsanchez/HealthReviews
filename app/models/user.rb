class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :hospitals, through: :reviews

    validates :name,:username, uniqueness: true
    validates :name, presence: true
    has_secure_password

end
