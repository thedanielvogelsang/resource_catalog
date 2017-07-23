class SearchboardController < ApplicationController
  layout 'search'

  def index
    @user = current_user
    @communities = @user.communities
    @skills = []
    @communities.each do |community|
      @skills += Skill.joins(:communities).where(communities: {id: community.id})
    end
  end
end
