class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
      
    @query = Profile.search(params[:search]).as_json
    if @query && @query.length > 0

      @user = @query
      @login = @query[0]['owner']['login']
      @url = @query[0]['owner']['url']
      @repos = @query.count 
    elsif params[:search] != ""
      @err = "User not found. Please check eventual typos."
    else params[:search] = ""
      @err = "You must type something to perform a search."
    end
  end

  def show
  end

  def new
  end

  def create
    @profile = Profile.create!(login: @login, url: @url, repos: @repos)
  end

  def destroy
  end

end
