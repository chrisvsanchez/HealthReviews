class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :hospitals, through: :reviews
    has_secure_password
    #  validates :username, presesence: true, uniqueness: true


    # validates :name, presence: true

    # def password=(plaintext_password)
    #     #run plain password through hashing a\
    #     #save it 
    #     encrypted_pw =  BCrypt::Password.create(plaintext_password)
    #     self.password_digest =   encrypted_pw
    #     byebug
    # end

    # def authenticate(plaintext_password)
    #    #pull out password_digest out of database
    #    #turn it into a instance Bcrpt
    #    #compare encrypted to plain text
    #    encrypted_pw = BCrypt::Password.new(self.password_digest)
    #    encrypted_pw == plaintext_password
    # end
end
