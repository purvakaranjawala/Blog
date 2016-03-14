class Article < ActiveRecord::Base
 has_many :comments, dependent: :destroy
 # validates :title, presence: true,length: { minimum: 5 }
 validates_presence_of :title 
 validates :text, presence: true  
 
 def name
 [title,text].join " "
 end               
end
