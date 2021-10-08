class FavoritesController < ApplicationController

    get '/favorites' do
        Favorite.all.to_json
    end

    get '/favorites/:id' do
        favorite = Favorite.find(params[:id])
        favorite.to_json
    end

    get '/favorites/user/:id' do
        user = User.find(params[:id])
        user.favorites.to_json
    end

    post '/favorites' do
        ## add logic to check if user already has the favorite
        
        favorite = params[:favorite]
        # user = User.find(favorite[:user_id])
        # fav = if user.favorite_check(favorite[:title], favorite[:location], favorite[:image], favorite[:user_id]) == false
            Favorite.create(
                title: favorite[:title],
                location: favorite[:location],
                image: favorite[:image],
                user_id: favorite[:user_id]
            ).to_json
        # else
        #     "Error: Favorite already added".to_json
        # end
    end

    delete '/favorites/:id' do
        favorite = Favorite.find(params[:id])
        favorite.destroy.to_json
        # redirect to '/favorites/:id'
    end
end