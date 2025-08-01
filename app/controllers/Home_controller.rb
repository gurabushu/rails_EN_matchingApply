class HomeController < ApplicationController
  def index
    @users = User.all
    @skills = User.distinct.pluck(:skills).compact.reject(&:blank?)
    
  end
end
