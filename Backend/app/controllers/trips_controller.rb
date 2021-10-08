class TripsController < ApplicationController

    get '/trips' do
        Trip.list.to_json
    end

    get '/trips/:id' do
        trip = Trip.find(params[:id])
        trip.sort.to_json
        # trip.to_json
    end

    post '/trips' do
        trip = Trip.create(
            title: params[:title],
            location: params[:location],
            image: params[:image],
            description: params[:description],
            lengthOfStay: params[:lengthOfStay],
            user_id: params[:user_id]
        ).to_json
        redirect to '/trips'
    end

    patch '/trips/:id' do
        trip = Trip.find(params[:id])
        trip.update(params)
    end

    delete '/trips/:id' do
        trip = Trip.find(params[:id])
        trip.destroy
    end
end