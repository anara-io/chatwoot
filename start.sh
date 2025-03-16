#!/bin/sh

set -e

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to become ready..."
until pg_isready -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USERNAME; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 2
done
echo "PostgreSQL is up - continuing"

# Run database migrations if needed
echo "Running database migrations..."
bundle exec rails db:migrate

# Start the Rails server with our CORS environment variables
echo "Starting Chatwoot server..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}
