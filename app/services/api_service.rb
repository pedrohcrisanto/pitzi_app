require 'net/http'
require 'uri'
require 'json'

class ApiService
  uri = URI.parse("https://pitzi-api.herokuapp.com/clients")
  
  ApiServiceData = Struct.new(:name, :cpf, :email, keyword_init: true)
  
  def initialize(name, cpf, email)
    @data = ApiServiceData.new(name: name, cpf: cpf, email: email)
  end
  
  def post_call
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Accept"] = "application/json"
    
    request.body = JSON.dump({
        "name" => @data.name,
        "cpf" => @data.cpf,
        "email" => @data.email
    })

    req_options = {
        use_ssl: uri.scheme == "https",
        }
        
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
    end
  end
end