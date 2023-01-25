namespace :db do
  desc "Seed the database with data from db/data.json"
  task seed: :environment do
    require 'json'
    file = File.read('db/data.json')
    data = JSON.parse(file)
    data.each do |post_data|
      Post.create(post_data)
    end
  end
end
