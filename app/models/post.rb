class Post < ActiveRecord::Base
  has_attached_file :image, :styles => {:large => "500x500", :medium => "250x250", :thumb => "100x100"}
end
