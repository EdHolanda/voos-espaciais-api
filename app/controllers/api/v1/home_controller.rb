class  Api::V1::HomeController < ApplicationController
  def index
    render json: "Back-end Challenge 2021 🏅 - Space Flight News", staus: 200
  end
end
