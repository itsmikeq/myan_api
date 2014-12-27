require 'oj'
class ApiRouter
  attr_reader :route
  def initialize(request_route)
    @route = request_route
    puts "Found route: #{@route.inspect}"
  end

  def key
    @key ||= Oj.load(route)
  end

  def routes
    @routes ||= RouteKey.where(key: key)
  end
end