# Log Viewer

A Quarto document that displays log files in searchable tables. This tool provides an easy way to view and search through log files with a clean, interactive interface.

## Features

- Displays log files in searchable tables
- Shows line numbers and content
- Responsive layout with automatic column sizing
- Supports multiple log files
- Interactive search functionality

## Usage

1. Place your log files in the `logs/` directory
2. Update the `files` parameter in `log_viewer.qmd` to include your log file names (without the .log extension)
3. Render the document using Quarto:

```bash
quarto render log_viewer.qmd
```

## Requirements

Required R packages:
- (see library calls in the first chunk)
- webshot

PhantomJS ... install it with webshot::install_phantomjs()



## Development

The document can be rendered in development mode without specifying parameters, which will use default values for testing. 