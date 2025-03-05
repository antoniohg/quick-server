# Quick Server

This script provides a simple way to start a local HTTP server in any directory.

## Overview

Quick Server allows you to quickly serve files from your current working directory over HTTP, making it easy to develop and test web applications locally.

## Installation

1. Clone this repository or download the script:
    ```bash
    git clone https://github.com/username/quick-server.git
    ```

2. Make the script executable:
    ```bash
    chmod +x /path/to/quick-server.sh
    ```

3. Optionally, add it to your PATH for global access.

## Usage

```bash
quick-server.sh [port] [directory]
```

Where `[port]` is an optional parameter to specify the port number (default is 8000) and `[directory]` is an optional parameter to specify the directory to serve (default is the current directory).

## Examples

Start a server on the default port (8000):
```bash
quick-server ~/Developer/my-website 
```

Start a server on port 3000:
```bash
quickServer 3000 ~/Developer/my-website
```

# from terminal
```zsh
quick-server 3000 ~/Developer/my-website
```

## Features

- Simple to use with minimal configuration
- Optional port selection
- Access files from your browser at `http://localhost:[port]`
- Nice color output for easy readability

## Requirements

- Python (for Python's built-in HTTP server) or Node.js (for http-server)

## License

GNU GENERAL PUBLIC LICENSE Version 3

This script is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This script is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this script. If not, see [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/).