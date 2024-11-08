#!/bin/sh
echo "Waiting for database to be set up..."
# Run migrations or seeding only if necessary
sleep 55 && echo "Running database seed..." && echo "y" | yarn seed
# Start the application
yarn develop
