module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | MyanApi"      
    end
  end
end
