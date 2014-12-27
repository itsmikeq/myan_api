class CustomRoutesController < ApplicationController
  before_action :set_custom_route, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @custom_routes = CustomRoute.all
    respond_with(@custom_routes)
  end

  def show
    respond_with(@custom_route)
  end

  def new
    @custom_route = CustomRoute.new
    respond_with(@custom_route)
  end

  def edit
  end

  def create
    @custom_route = CustomRoute.new(custom_route_params)
    @custom_route.save
    respond_with(@custom_route)
  end

  def update
    @custom_route.update(custom_route_params)
    respond_with(@custom_route)
  end

  def destroy
    @custom_route.destroy
    respond_with(@custom_route)
  end

  private
    def set_custom_route
      @custom_route = CustomRoute.find(params[:id])
    end

    def custom_route_params
      params.require(:custom_route).permit(:owner_id, :name, :owner_type, :data, :version)
    end
end
