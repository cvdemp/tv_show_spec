require "sinatra"
require "sinatra/activerecord"

set :views, File.join(File.dirname(__FILE__), "app/views")
require_relative "app/models/television_show"

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  shows = TelevisionShow.all
  erb :index, locals: { shows: shows }
end

get "/television_shows/new" do
  show = TelevisionShow.new
  erb :new, locals: { show: show }
end

get "/television_shows/:id" do
  show = TelevisionShow.find(params[:id])
  erb :show, locals: { show: show, show_end: show_end(show) }
end

get "/television_shows/:id/edit" do
  show = TelevisionShow.find(params[:id])
  erb :new, locals: { show: show }
end

def show_end(show)
  if show.ending_year == nil
    "Present"
  else
    show.ending_year
  end
end

post "/television_shows" do
  show = TelevisionShow.new(params[:television_show])

  if show.save
    redirect "/television_shows"
  else
    erb :new, locals: { show: show }
  end
end
