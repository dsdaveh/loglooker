# install/load pacman
if (!require("pacman")) install.packages("pacman")
pacman::p_load(dotenv, rsconnect, repos = getOption("repos"))

# Load environment variables from .env at runtime
library(dotenv)
load_dot_env()

library(rsconnect)

# Get app name from command line argument or use default
args <- commandArgs(trailingOnly = TRUE)
app_name <- if (length(args) > 0) args[1] else "LogLooker"

# Set up server and user
server_url <- trimws(Sys.getenv("POSIT_CONNECT_SERVER"))  # Remove any leading/trailing whitespace
api_key <- Sys.getenv("POSIT_CONNECT_APIKEY")

# Debug: Print the values (masking the API key)
cat("Server URL:", server_url, "\n")
cat("API Key:", paste0(substr(api_key, 1, 4), "..."), "\n")
cat("App Name:", app_name, "\n")

if (server_url == "" || api_key == "") {
  stop("POSIT_CONNECT_SERVER and POSIT_CONNECT_APIKEY must be set in the environment or .env file.")
}

# Clean up the server URL
server_url <- gsub("/+$", "", server_url)  # Remove all trailing slashes
server_url <- paste0(server_url, "/")      # Add exactly one trailing slash

# Debug: Print the final server URL
cat("Final server URL:", server_url, "\n")

# Add server using the new function
rsconnect::addServer(
  url = server_url,
  name = "myconnect"
)

# Connect using API key
rsconnect::connectApiUser(
  account = "myconnect",
  server = "myconnect",
  apiKey = api_key
)

# Get absolute path to the Quarto document
doc_path <- normalizePath("loglooker_run.qmd", mustWork = TRUE)
cat("Deploying document:", doc_path, "\n")

# List files in current directory for debugging
cat("\nFiles in current directory:\n")
print(list.files())

# Deploy using deployApp
rsconnect::deployApp(
  appDir = dirname(doc_path),
  appFiles = c("loglooker_run.qmd", "logs"),
  appPrimaryDoc = "loglooker_run.qmd",
  server = "myconnect",
  appName = app_name
) 
