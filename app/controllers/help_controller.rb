class HelpController < ApplicationController

  swagger_controller :Help, "Help information and status"
  
  swagger_api :help do
    summary "Returns help about the server and the API"
    notes "This is meant to be rudimentary help not a full blown manual"
    param :query, :search, :string, :optional, "Search for help on a given topic"
    response :helpText
    response :notFound
  end

  def help
	render :json => { message: "No help yet" }, :status => 200
  end

  swagger_api :status do
    summary "Returns status of the server with any useful debugging information"
    notes "This really MUST be blocked in production externally"
    response :statusText
    response :serverBroken
  end

  def status
	render :json => { message: "Seems to be working" }, :status => 200
  end

  swagger_api :identify do
    summary "Returns a unique identifier for this server"
    notes "This may need blocking in production"
    response :serverID
  end

  def identify
	render :json => { message: "It's me" }, :status => 200
  end

  swagger_api :echo do
    summary "Returns and echo of the given parameter to prove the service is alive"
    notes "This is just for testing and should probably be blocked in production"
    param :query, :echoString, :string, :required, "String to echo back"
    response :echoString
    response :noEchoString
  end
  
  def echo
	echoString = params[:echoString]
	render :json => { message: "Echo: #{echoString}" }, :status => 200
  end
end
