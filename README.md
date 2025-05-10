# Log Viewer

A Quarto-based log file viewer that displays log files in an interactive, searchable table format.

## Features

- Interactive table view of log files
- Searchable content
- Support for multiple log files
- Compact display with adjustable font sizes
- Line numbers for easy reference

## Usage

1. Place your log files in the `logs` directory
2. Update the `files` parameter in `log_viewer.qmd` to include your log file names (or use the prep script below)
3. **(Recommended)** Run the prep script to automatically generate a Quarto file with the correct log file list:
   ```bash
   ./loglooker_prep
   ```
   This will create a new file called `loglooker_run.qmd` with the correct YAML for all `.log` files in the `logs` directory.
4. Render the Quarto document:
   ```bash
   quarto render loglooker_run.qmd
   ```

## Requirements

Required R packages:
- (see library calls in the first chunk)
- webshot

PhantomJS ... install it with webshot::install_phantomjs()


## Development

The document can be rendered in development mode without specifying parameters, which will use default values for testing. 