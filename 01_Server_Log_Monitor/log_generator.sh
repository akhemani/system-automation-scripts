#!/bin/bash

# Log file location
LOG_FILE="server.log"

# Function to generate a random status code
generate_status_code() {
  local status_codes=("200" "201" "301" "400" "401" "403" "404" "500")
  echo ${status_codes[$RANDOM % ${#status_codes[@]}]}
}

# Function to generate a random IP address
generate_ip_address() {
  echo "192.168.1.$((RANDOM % 256))"
}

# Function to generate a random URL path
generate_url() {
  local paths=("/api/users" "/api/login" "/api/orders" "/api/products" "/dashboard" "/health" "/about")
  echo ${paths[$RANDOM % ${#paths[@]}]}
}

# Function to simulate a random HTTP log entry
generate_log_entry() {
  local ip_address=$(generate_ip_address)
  local status_code=$(generate_status_code)
  local url=$(generate_url)
  local method=("GET" "POST" "DELETE" "PUT" "PATCH")
  local request_method=${method[$RANDOM % ${#method[@]}]}
  local timestamp=$(date "+%d/%b/%Y:%H:%M:%S +0000")
  local user_agent="Mozilla/5.0"
  local response_size=$((RANDOM % 2048 + 500))  # Random response size between 500 and 2048 bytes

  echo "$ip_address - - [$timestamp] \"$request_method $url HTTP/1.1\" $status_code $response_size \"-\" \"$user_agent\"" >> $LOG_FILE
}

# Run the log generation in an infinite loop every 3 seconds
while true; do
  generate_log_entry
  sleep 3
done


