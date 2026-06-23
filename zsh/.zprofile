# System-specific setup
# Darwin
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
