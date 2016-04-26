class Plan < ActiveRecord::Base
	 has_many :suggestions, dependent: :destroy
belongs_to :user
end

