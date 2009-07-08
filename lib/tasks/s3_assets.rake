require 'right_aws'

namespace :s3 do
  namespace :assets do
    desc "Upload static assets to S3"
    task :upload => :environment do
      s3 = RightAws::S3.new(
        S3_CONFIG['access_key_id'], 
        S3_CONFIG['secret_access_key']
      )
      bucket = s3.bucket(S3_CONFIG['bucket'], true, 'public-read')
      
      files = Dir.glob(File.join(RAILS_ROOT, "public/**/*_packaged.{css,js}"))
            
      files.each do |file|
        filekey = file.gsub(/.*public\//, "").gsub(/_packaged/, "_packaged_#{REVISION}")
        key = bucket.key(filekey)
        begin
          File.open(file) do |f|
            key.data = f
            key.put(nil, 'public-read', {'Expires' => 1.year.from_now})
          end
        rescue RightAws::AwsError => e
          puts "Couldn't save #{key}"
          puts e.message
          puts e.backtrace.join("\n")
        end
      end
    end
  end
end