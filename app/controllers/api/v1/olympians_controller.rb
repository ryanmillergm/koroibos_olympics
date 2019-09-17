class Api::V1::OlympiansController < ApplicationController
  def index
    if age_params[:age] == nil
      render json: Olympian.all
    elsif
      age_params[:age] == "youngest"
      render json: Olympian.youngest
    end
  end

  private

  def age_params
    params.permit(:age)
  end
end
