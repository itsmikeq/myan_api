class RouteKeysController < ApplicationController
  before_action :set_route_key, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @route_keys = RouteKey.all
    respond_with(@route_keys)
  end

  def show
    respond_with(@route_key)
  end

  def new
    @route_key = RouteKey.new
    respond_with(@route_key)
  end

  def edit
  end

  def create
    @route_key = RouteKey.new(route_key_params)
    @route_key.save
    respond_with(@route_key)
  end

  def update
    @route_key.update(route_key_params)
    respond_with(@route_key)
  end

  def destroy
    @route_key.destroy
    respond_with(@route_key)
  end

  private
    def set_route_key
      @route_key = RouteKey.find(params[:id])
    end

    def route_key_params
      params.require(:route_key).permit(:key, :owner_id, :owner_type, :custom_route_id)
    end
end
