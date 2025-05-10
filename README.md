# LogLooker

A Quarto-based log file viewer that displays log files in an interactive table format.

## Setup

1. Clone this repository
2. Create a `.env` file based on the `.env_template`:
   ```bash
   cp .env_template .env
   ```
3. Edit `.env` and set your Posit Connect credentials:
   ```
   POSIT_CONNECT_SERVER=https://your-connect-server.com/
   POSIT_CONNECT_APIKEY=your-api-key
   ```

## Usage

### Preparing Log Files

1. Place your log files in the `logs` directory with `.log` extension
2. Run the preparation script to update the Quarto document:
   ```bash
   ./loglooker_prep
   ```

### Deployment

You can deploy to Posit Connect using either method:

#### R-based Deployment (Recommended)

Use the R script for deployment:
```bash
Rscript deploy_rsc.R
```

This script will:
- Load environment variables from your `.env` file
- Connect to your Posit Connect server
- Deploy the Quarto document and log files

#### Manual Deployment

1. Open `loglooker_run.qmd` in RStudio
2. Click "Publish" and select your Posit Connect server

## Features

- Interactive table view of log files
- Searchable content
- Adjustable number of lines displayed (10, 25, 50, or 100)
- Table of contents for easy navigation
- Automatic updates when log files change

## Dependencies

- PhantomJS ... install it with webshot::install_phantomjs()


## Development

The document can be rendered in development mode without specifying parameters, which will use default values for testing. 