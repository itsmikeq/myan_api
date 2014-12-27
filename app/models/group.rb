class Group < ActiveRecord::Base
  has_many :custom_routes, as: :owner
  has_many :members
  has_many :users, through: :members, class_name: "User"
end
