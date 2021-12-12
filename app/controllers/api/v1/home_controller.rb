class  Api::V1::HomeController < ApplicationController
  def index
    @mensagem = 'Back-end Challenge 2021 🏅 - Space Flight News'
    render json: @mensagem, status: 200
  end
end
