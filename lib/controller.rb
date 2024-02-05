require 'sinatra/base' # j'ai chercher et si j'ai aps ca ca ne marche
require_relative 'gossip'  # U require_relative pour le chemin local

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: {gossip: Gossip.find(params["id"].to_i), id: params["id"].to_i }
  end

  get '/gossips/:id/edit/' do 
    erb :edit , locals: {gossip: Gossip.find(params['id'].to_i), id: params["id"].to_i}
  end

  post '/gossips/:id/edit/' do 
    Gossip.update(params["gossip_author"], params["gossip_content"], params['id'])
    redirect '/'
  end
  
end