namespace :sample_data do
  desc "Generate sample assets with related records"
  task generate: :environment do
    puts "Generating sample data..."

    # Configuration
    NUM_BUSINESSES = 3
    ASSETS_PER_BUSINESS = 5..10  # Random range
    LOCATIONS_PER_BUSINESS = 2..4 # Random range

    def random_uuid
      SecureRandom.uuid
    end

    def random_address
      {
        line1: Faker::Address.street_address,
        line2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        region: Faker::Address.state,
        country: Faker::Address.country_code
      }
    end

    unless ENV["USER_ID"]
      puts "ERROR: USER_ID environment variable must be set"
      puts "Usage: USER_ID=123 rails sample_data:generate"
      exit 1
    end

    creator = User.find_by(id: ENV["USER_ID"])
    unless creator
      puts "ERROR: No user found with id #{ENV["USER_ID"]}"
      exit 1
    end

    puts "Using creator: #{creator.email}"

    # Create businesses
    NUM_BUSINESSES.times do |i|
      business = Business.create!(
        name: "Sample Business #{i + 1}",
        category: [ "Dealer", "Service Center", "Fleet" ].sample,
        description: Faker::Company.catch_phrase,
        uuid: random_uuid,
        created_by_user_id: creator.id,
        updated_by_user_id: creator.id,
        metadata: {}
      )

      puts "Created business: #{business.name}"

      # Create locations for this business
      locations = rand(LOCATIONS_PER_BUSINESS).times.map do |j|
        addr = random_address
        location = Location.create!(
          uuid: random_uuid,
          name: "#{business.name} Location #{j + 1}",
          description: Faker::Company.bs,
          address_line_1: addr[:line1],
          address_line_2: addr[:line2],
          city: addr[:city],
          geographical_region: addr[:region],
          country_iso_code: addr[:country],
          timezone: "UTC",
          culture: "en-US",
          created_by_user_id: creator.id,
          metadata: {}
        )

        # Create business location link
        BusinessLocation.create!(
          uuid: random_uuid,
          business: business,
          location: location,
          name: location.name,
          created_by_user_id: creator.id,
          metadata: {}
        )

        location
      end

      puts "  Created #{locations.size} locations"

      # Create assets for this business
      rand(ASSETS_PER_BUSINESS).times do |k|
        # Create asset identity first
        identity = AssetIdentity.create!(
          uuid: random_uuid,
          make: Faker::Vehicle.make,
          model: Faker::Vehicle.model,
          year: rand(1990..2024),
          vin: Faker::Vehicle.vin,
          serial_number: Faker::Device.serial,
          created_by_user_id: creator.id
        )

        # Create asset record
        asset = Asset.create!(
          uuid: random_uuid,
          asset_identity: identity,
          business_location: business.business_locations.sample,
          created_by_user_id: creator.id,
          updated_by_user_id: creator.id
        )

        puts "  Created asset: #{identity.make} #{identity.model} (#{identity.year})"
      end
    end

    puts "\nSample data generation complete!"
    puts "Created:"
    puts "  - #{Business.count} businesses"
    puts "  - #{Location.count} locations"
    puts "  - #{BusinessLocation.count} business locations"
    puts "  - #{AssetIdentity.count} asset identities"
    puts "  - #{Asset.count} assets"
  end

  desc "Remove all sample data"
  task cleanup: :environment do
    puts "Cleaning up sample data..."

    Asset.destroy_all
    AssetIdentity.destroy_all
    BusinessLocation.destroy_all
    Location.destroy_all
    Business.destroy_all

    puts "Sample data cleaned up!"
  end
end
