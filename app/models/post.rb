class Post < ActiveRecord::Base
  has_attached_file :image, 
                    :styles => {:large => "500x500", :medium => "250x250", :thumb => "100x100"}, 
                    :storage => 's3', 
                    :s3_credentials => YAML.load_file("#{RAILS_ROOT}/config/amazon_s3.yml")[RAILS_ENV], 
                    :bucket => "built-for-speed", 
                    :path => ":class/:id/:style.:extension"
                    
  def cloudfront_url( variant = nil )
    image.url(variant).gsub( "http://s3.amazonaws.com/built-for-speed", CLOUDFRONT_DISTRIBUTION )
  end    
end
