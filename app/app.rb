ENV["RACK_ENV"] ||= "development" # the app runs in development mode by default
require 'sinatra/base'
require_relative './models/link'
require_relative './models/data_mapper_setup'



class BookmarkManager < Sinatra::Base
  get '/' do

  end

  get '/links' do

    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag

    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first_or_create(name: params[:name])
    @links = tag.links
    erb :links
  end


  run! if app_file == $0
end
