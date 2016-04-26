class Micropost < ActiveRecord::Base
      belongs_to :user 
      has_many :reviews
      default_scope -> { order(created_at: :desc) }   

      validates :user_id, presence: true
      validates :content, presence: true

      has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "1.jpg"
      validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
      validates_attachment_presence :image
    end