class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :trips
    has_many :favorites 

    def favorite_check(title, location, image, user)
        self.favorites.map {|favorite| title == favorite.title && location == favorite.location && favorite == favorite.image ? true : false}
    end
end