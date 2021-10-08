class UsersController < ApplicationController

    get '/users' do
        ## .map on users, to keep out passwords
        User.all.map{|user| {user_id: user.id, firstName: user.firstName, lastName: user.lastName, username: user.username, isLoggedIn: user.isLoggedIn}}.to_json
    end

    get '/users/:id' do
        user = User.find(params[:id])
        user.to_json
    end

    post '/users' do
        user = User.create(
            firstName: params[:firstName],
            lastName: params[:lastName],
            username: params[:username],
            password: params[:password],
            isLoggedIn: true
        )
    end

    patch '/logout/:id' do
        user = User.all.find{|user| user.isLoggedIn == true}
        user.isLoggedIn = false
        user.save
    end

    get '/login' do
        User.select{|user| user.isLoggedIn == true}.to_json
    end

    patch '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            user.isLoggedIn = true
            user.save
            redirect to '/trips'
        else
            flash[:error] = "Your credentials are invalid, please sign up or try again."
            redirect to '/'
        end
    end
end