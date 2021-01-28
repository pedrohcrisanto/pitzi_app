class HomeController < ApplicationController

  def index
  end

  def post_form_client
    name = params[:name]
    cpf = params[:cpf]
    email = params[:email]
    
    ClientService.new(name, cpf, email).post_client

    redirect_to home_path
  end

  def post_form_signature
    cellphone_model = params[:cellphone_model]
    imei = params[:imei]
    price = params[:price]
    number_portion = params[:number_portion]
    cpf = params[:cpf]
  
    SignatureService.new(cellphone_model, imei, price, number_portion, cpf).post_signature
    
    redirect_to home_path
  end
end
