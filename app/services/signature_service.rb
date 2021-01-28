require 'net/http'
require 'uri'
require 'json'

class SignatureService

  SignatureServiceData = Struct.new(:cellphone_model, :imei, :price, :number_portion, :cpf, keyword_init: true)

  def initialize(cellphone_model, imei, price, number_portion, cpf)
    @data = SignatureServiceData.new(cellphone_model: cellphone_model, imei: imei, price: price, number_portion: number_portion, cpf: cpf)
  end
  
  def post_signature
    uri = URI.parse("https://pitzi-api.herokuapp.com/signatures")

    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    
    request.body = JSON.dump({
        "cellphone_model" => @data.cellphone_model,
        "imei" => @data.imei,
        "price" => @data.price,
        "number_portion" => @data.number_portion,
        "cpf" => @data.cpf
    })

    req_options = {
        use_ssl: uri.scheme == "https",
        }
        
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
    end
  end
end