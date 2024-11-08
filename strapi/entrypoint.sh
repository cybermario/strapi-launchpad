#!/bin/sh
echo "Waiting for database to be set up..."

# Wait for the database to be ready
sleep 55

# Check if IMPORT_DATA is set to "true" before running the seed command
if [ "$IMPORT_DATA" = "true" ]; then
  echo "IMPORT_DATA is set to true. Running database seed..."
  echo "y" | yarn seed
else
  echo "IMPORT_DATA is not set to true. Skipping database seed."
fi

# Start the application
yarn develop
