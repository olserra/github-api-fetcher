class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @response = Profile.search(params[:search]).as_json

    @user = @response
    @login = @response[0]['owner']['login']
    @url = @response[0]['owner']['url']
    @repos = @response.count  
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

end
