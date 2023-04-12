require 'csv'

# rake import:station_data
namespace :import do
  #このdescはdescribeのdesc
  desc "Import area from csv"

  task posts: :environment do
    path = File.join Rails.root, "db/csv/area.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      list << {
        name: row["name"],
        link: row["link"],
        sentence: row["sentence"],
        category: row["category"],
        image: row["image"]
      }
    end
    puts "start to create station data"
    begin
      Post.create!(list) #クラス名注意
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end