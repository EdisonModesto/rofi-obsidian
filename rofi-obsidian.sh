#!/bin/bash

# Path to the .md file you want to append the text to
MD_FILE="/home/a4meta/Documents/Edison's Vault/Z. PLUGINS FOLDER/Tasks/Tasks.md"

# Function to append the input to the .md file
append_to_md_file() {
  input="$1"
  echo -e "$input" >> "$MD_FILE"
  echo "Text appended successfully!"
}

# Main function
main() {
  # Legends to be displayed below the Rofi input field
  legends="Legends:\nDue Date - 📅 2023-07-28\n"

  # Full path to the Rasi theme file
  rasi_theme="/home/a4meta/Desktop/rofi-obsidian/config.rasi"

  # Get input from user using rofi (height set to 3 lines)
  input=$(echo -e "\n$legends" | rofi -dmenu -p "Quick Capture Task" -theme "$rasi_theme" -lines 3 -disable-history)

  # Check if the input is not empty and append to the .md file
  if [ -n "$input" ]; then
    append_to_md_file "- [ ] #task $input"
  else
    echo "No input provided. Nothing was appended."
  fi
}

# Run the main function
main

