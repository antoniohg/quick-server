#!/bin/bash

# Author: antoniohg (https://github.com/antoniohg)
# Description: Start a web server in the current directory
# Dependencies: Python 3 or Node.js (http-server)
# Usage: quick_server [port] [directory]
#   port: The port to use for the server (default: 8000)
#   directory: The directory to serve (default: .)

function quick_server() {
  local port=${1:-8000}
  local dir=${2:-.}

  # Define color codes
  PURPLE='\033[0;35m'
  GREEN='\033[1;32m'      # Brighter green
  BLUE='\033[1;34m'       # Brighter blue
  CYAN='\033[1;36m'       # Bright cyan
  YELLOW='\033[1;33m'     # Bright yellow
  RED='\033[1;31m'        # Bright red
  MAGENTA='\033[1;35m'    # Bright magenta
  NC='\033[0m'            # No Color
  
  echo -e "${MAGENTA}🚀 Starting web server on port ${CYAN}$port${MAGENTA} serving ${YELLOW}$dir${NC}"
  echo -e "${GREEN}🌐 Visit ${BLUE}http://localhost:$port${GREEN} in your browser${NC}"
  echo -e "${RED}⌨️  Press ${YELLOW}Ctrl+C${RED} to stop the server${NC}"
  
  # Check if the port is available or in use and kill the process before starting the server
  lsof -ti:$port | xargs kill -9 2>/dev/null

  # Start the server with Python 3 if available, otherwise use Node.js http-server
  if command -v python3 &> /dev/null; then
    echo -e "${GREEN}🐍 Using Python 3 to start the server${NC}"
    echo -e "${YELLOW}✨ Server is now running...${NC}"
    
    # Execute python with custom output formatting
    (python3 -m http.server "$port" --directory "$dir" 2>&1 | while read line; do
      # Filter out the standard messages and replace with prettier ones
      if [[ $line == *"Serving HTTP on"* ]]; then
        continue # Skip the standard "Serving HTTP on" message
      elif [[ $line == *"http://"* && $line != *"localhost"* ]]; then
        continue # Skip non-localhost URLs
      else
        # Format log entries with pretty colors
        timestamp=$(date "+%H:%M:%S")
        if [[ $line == *" 200 "* ]]; then
          echo -e "${CYAN}[$timestamp]${GREEN} ✅ $line${NC}" # Success
        elif [[ $line == *" 404 "* ]]; then
          echo -e "${CYAN}[$timestamp]${RED} ❌ $line${NC}" # Not Found
        else
          echo -e "${CYAN}[$timestamp]${YELLOW} 🔍 $line${NC}" # Other status
        fi
      fi
    done) &
    
    # Keep script running until Command + C is pressed
    wait
  else
    echo -e "${GREEN}🟢 Using Node.js to start the server${NC}"
    npx http-server "$dir" -p "$port" -c-1
  fi
}

# Usage: quick_server 8080 ~/Developer/my-site

quick_server "$1" "$2"
