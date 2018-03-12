require 'net/http'
class ApisController < ApplicationController
  before_action :require_user

  def fetch
    ## basic uri syntax right here:
    uri = URI('http://dog.ceo/api/breeds/list/all')
    p uri

    ## get response from HTTP request (in this case, request to an API)
    res = Net::HTTP.get_response(uri)
    p res
    ## every RESPONSE has a body
    p res.body


    ## this body was JSON - so I told Ruby to parse thru it
    ## and make it useable - aka. now it's a hash
    res = JSON.parse(res.body)
    p res

    ## this hash has a 'message' key, and it's value is another hash
    ## wherein all the keys are different dog types
    @dogs = res['message'] ## hash of dog types
  end

  def pictures
    uri = URI("https://dog.ceo/api/breed/#{params[:doggo]}/images")
    p uri

    ## get response from HTTP request (in this case, request to an API)
    res = Net::HTTP.get_response(uri)
    p res
    ## every RESPONSE has a body
    p res.body


    ## this body was JSON - so I told Ruby to parse thru it
    ## and make it useable - aka. now it's a hash
    res = JSON.parse(res.body)
    @dogs = res['message']
  end

  private

  def require_user
    redirect_to root_path unless current_user
  end
end
