class CustomerRoutesController < ApplicationController
  # before_action :set_custom_route, only: [:show, :edit, :update, :destroy]
  respond_to :json
  def api_finder
    @message = "#{params[:route]}"
    ApiRouter.new(params[:route])
    puts "#{@message}"
  end

  private
  def set_request
    @request
  end
end