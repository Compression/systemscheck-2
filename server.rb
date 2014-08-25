require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'pry'
set :port, 9000

get '/' do
  redirect '/leaderboard'
end

get '/leaderboard' do
  @teams = []
  @i = 0
  @wins = []
  @losses = []
    CSV.foreach('record.csv', headers: true) do |team|
      @teams << team['team']
    end
    CSV.foreach('record.csv', headers: true) do |win|
      @wins << win['wins']
    end
    CSV.foreach('record.csv', headers: true) do |loss|
      @losses << loss['losses']
    end
  erb :index
end

# get "/teams/:team" do
#   @wins = []
#   @losses = []

  # CSV.foreach('record.csv', headers: true) do |win|
  #   @wins << win['wins']
  # end
  # CSV.foreach('record.csv', headers: true) do |loss|
  #   @losses << loss['losses']
  # end
#   erb :teams
# end
