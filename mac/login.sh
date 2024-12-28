#!/bin/bash
echo ".........................................................."
echo "Fetching ngrok TCP Endpoint for VNC..."

# Retrieve the ngrok TCP endpoint
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"tcp://[^"]*' | sed 's/"public_url":"//')

# Display the ngrok URL or an error if not found
if [ -z "$NGROK_URL" ]; then
    echo "Error: Unable to retrieve ngrok URL. Is ngrok running with 'tcp' mode?"
    exit 1
else
    echo "VNC IP: $NGROK_URL"
    echo "Username: runneradmin"
    echo "Password: P@ssw0rd!"
fi
