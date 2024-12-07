#!/bin/bash

# Define a list of possible names
NAMES=(
  "harry" "hermione" "ron" "dumbledore" "hagrid" "snape" "mcgonagall" "dobby" 
  "neville" "draco" "voldemort" "ginny" "luna" "fred" "george" "cho" "cedric"
  "sirius" "remus" "tonks" "bellatrix" "lucius" "narcissa" "fleur" "kingsley"
  "seamus" "dean" "percy" "peter" "hedwig" "buckbeak" "scabbers" "crookshanks"
  "grawp" "argus" "trelawney" "quirrell" "goyle" "crabbe" "lavender" "parvati"
  "padma" "victor" "slughorn" "filch" "flitwick" "pomfrey" "karkaroff" "barty"
  "grindelwald" "peeves" "moaningmyrtle" "winky" "kreacher" "helena" "thegrey" 
  "thebloody" "thefat" "thefriar" "aragog" "fenrir" "yaxley" "millicent" 
)

# Get a list of already used names from the tmux session variable
USED_NAMES=$(tmux show-option -gqv "@used_window_names")

# Pick a unique random name
random_name() {
  for _ in {1..100}; do
    NAME="${NAMES[RANDOM % ${#NAMES[@]}]}"
    if [[ ! " $USED_NAMES " =~ " $NAME " ]]; then
      echo "$NAME"
      return
    fi
  done
  echo "untitled" # Fallback if all names are used
}

# Get the random name
NAME=$(random_name)

# Rename the current window
tmux rename-window "$NAME"

# Add the name to the used list
USED_NAMES="${USED_NAMES} $NAME"
tmux set-option -gq @used_window_names "$USED_NAMES"