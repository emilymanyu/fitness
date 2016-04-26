class Suggestion < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
    validates :content, presence: true, length: { in: 0..30 }
    
end
