class Post < ActiveRecord::Base
	validates :title, :body, presence: { message: "Missing title or body/Duplicate post" }, uniqueness: true 
	has_many :comments
	def self.search(search)
  		where("name LIKE ?", "%#{search}%") 
  		where("body LIKE ?", "%#{search}%")
	end
end
