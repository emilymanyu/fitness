class Request < ActiveRecord::Base
	has_many :suggestions
	belongs_to :user
end
