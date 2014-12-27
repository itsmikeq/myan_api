# This is a sort of index of routes
class RouteKey < ActiveRecord::Base
  belongs_to :custom_route
  validates_uniqueness_of :key
  delegate :owner, to: :custom_route
end
