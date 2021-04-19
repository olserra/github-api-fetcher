class ComparisonsController < ApplicationController

  def create
    id_1 = params[:comparison][:profile_ids][0]
    id_2 = params[:comparison][:profile_ids][1]
    
    profile_1 = Profile.find(id_1) 
    @login_1 = profile_1.login
    @url_1 = profile_1.url
    @repos_1 = profile_1.repos
    
    profile_2 = Profile.find(id_2) 
    @login_2 = profile_2.login
    @url_2 = profile_2.url
    @repos_2 = profile_2.repos

    if(@repos_1 > @repos_2)
      @winner = @login_1
    elsif (@repos_2 > @repos_1)
      @winner = @login_2
    else (@repos_1 = @repos_2)
      @winner = 0
    end
  end
end
