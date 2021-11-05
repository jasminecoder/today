class WeightsController < ApplicationController
before_action :set_weight, only: %i[ update destroy ]


  def create
    @weight = current_user.weights.build(weight_params)
    @weight.save!
    redirect_to '/', notice: "Weight was successfully created."
  end

  def update
      if @weight.update(weight_params)
        redirect_to 'pages#dashboard', notice: "Weight was successfully updated."
      else
        render 'pages/dashboard', status: :unprocessable_entity
      end
  end

  def destroy
    @weight.destroy
      redirect_to 'pages#dashboard', notice: "Weight was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_params
      params.require(:weight).permit(:weight, :user_id, :weighed_on)
    end
end
