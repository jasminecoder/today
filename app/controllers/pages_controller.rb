class PagesController < ApplicationController
  def home
  end

  def dashboard
    @weights = current_user.weights.order("weighed_on DESC")
    @weight = current_user.weights.new
  end
  
 
  
 

end
