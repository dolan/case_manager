# lib/tasks/schema_dump.rb
namespace :db do
  namespace :sql do
    desc "Dumps the database to db/structure.sql"
    task dump: :environment do
      File.open(Rails.root.join("db/structure.sql"), "w") do |file|
        if ActiveRecord::Base.connection.adapter_name.downcase.include?("postgresql")
          system("pg_dump -s -x -O #{ActiveRecord::Base.connection_db_config.configuration_hash[:database]} > #{file.path}")
        end
      end
    end
  end
end
