class PagesController < ApplicationController
  def home
  end

  def dashboard
    @weights = current_user.weights
    @weight = current_user.weights.new
  end
 end
