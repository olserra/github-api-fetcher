class ProfilesController < ApplicationController

  def index
    if params[:search].present?
      search
    end
  end

  def create
    @query = Profile.search(params[:search]).as_json
    if @query && @query.length > 0

      @user = @query
      @login = @query[0]['owner']['login']
      @url = @query[0]['owner']['url']
      @repos = @query.count 
    end
    @profile = Profile.create!(login: @login, url: @url, repos: @repos)
    raise
  end

  def show
    @profiles = Profile.all
  end

  def new
  end

  def destroy
  end

  private

  def search
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

end
