class ProfilesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    if params[:search].present?
      search
    else
      @err = "You must type something to perform a search."
    end
  end

  def create
    if !(Profile.exists?(login: profile_params[:login]))
      Profile.create(profile_params)
      redirect_to show_path
    else
      @err = "This profile is already in your dB."
      render :index
    end
  end

  def show
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  private

  def search
    @query = Profile.search(params[:search]).as_json
    if @query && @query.length > 0

      @login = @query[0]['owner']['login']
      @url = @query[0]['owner']['url']
      @repos = @query.count

      @profile = Profile.new(login: @login, url: @url, repos: @repos)
    elsif params[:search] != ""
      @err = "User not found. Please check eventual typos."
    end
  end

  def profile_params
    params.require(:profile).permit(:login, :url, :repos)
  end

end
