class Comment < ActiveRecord::Base
  	belongs_to :course
    	validates :content, presence: true, length: { in: 0..30 }
    	  	belongs_to :user

end
