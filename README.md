# README

# API Documentation

This API provides a comprehensive set of endpoints for managing users, groups, roles, permissions, cases, and more. Below is an overview of the key aspects of the API.

## Ruby Version
The API is built using Ruby 3.x and Rails 6.x.

## System Dependencies
- PostgreSQL for the database
- Redis for caching and background job processing
- Sidekiq for background job processing

## Configuration
Configuration files are located in the `config` directory. Ensure you have the necessary environment variables set up as per the `config/application.yml` file.

## Database Creation
To create the database, run:

* Sample Data Generation

## Sample Data Generation

The application includes rake tasks for generating and cleaning up sample data. This is useful for development and testing purposes.

### Generating Sample Data

To generate sample data, use the `sample_data:generate` rake task. You can configure the amount of data generated using environment variables:

#### Required Parameters:
- `USER_ID`: The ID of the user who will be recorded as the creator of the sample records

#### Optional Parameters:
- `NUM_BUSINESSES`: Number of businesses to create (default: 3)
- `ASSETS_PER_BUSINESS`: Number of assets per business (default: random 5-10)
- `LOCATIONS_PER_BUSINESS`: Number of locations per business (default: random 2-4)

### Cleaning Up Sample Data

To remove all generated sample data:

```bash
rails sample_data:cleanup
```

This will remove all generated:
- Assets
- Asset Identities
- Business Locations
- Locations
- Businesses

Note: The cleanup task will not remove the user specified in `USER_ID`.
