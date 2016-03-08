class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end
  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  get '/figures' do
    erb :'figures/index'
  end
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << landmark
    end
    @figure.save
    erb :'figures/show'
  end
end
