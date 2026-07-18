#!/bin/bash
# File Opener (Create / Open / Edit / Move / Close)
# Explanation: A standalone menu-driven script that lets the user
# create a new file, open (view) it, edit it, move it out of the
# script's folder, and close the program.

# Work out the folder this script is sitting in, regardless of where
# it's run from. New files are created here.
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

FILE_PATH=""   # currently selected file (empty until Create or Open is used)

while true; do
    echo
    echo "===== File Menu ====="
    if [ -n "$FILE_PATH" ]; then
        echo "Current file: $FILE_PATH"
    else
        echo "Current file: (none selected)"
    fi
    echo "1) Create"
    echo "2) Open"
    echo "3) Edit"
    echo "4) Move"
    echo "5) Close"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1)
            read -p "Enter a name for the new file: " FILE_NAME

            if [ -z "$FILE_NAME" ]; then
                echo "Error: you must enter a filename."
                continue
            fi

            NEW_PATH="$SCRIPT_DIR/$FILE_NAME"

            if [ -f "$NEW_PATH" ]; then
                echo "Error: $NEW_PATH already exists."
                continue
            fi

            touch "$NEW_PATH"
            FILE_PATH="$NEW_PATH"
            echo "Created $FILE_PATH"
            ;;

        2)
            read -p "Enter the filename to open: " FILE_NAME

            if [ -z "$FILE_NAME" ]; then
                echo "Error: you must enter a filename."
                continue
            fi

            # Allow either a bare name (looked up in SCRIPT_DIR) or a full path
            if [ -f "$FILE_NAME" ]; then
                CANDIDATE="$FILE_NAME"
            else
                CANDIDATE="$SCRIPT_DIR/$FILE_NAME"
            fi

            if [ ! -f "$CANDIDATE" ]; then
                echo "Error: $CANDIDATE does not exist."
                continue
            fi

            FILE_PATH="$CANDIDATE"
            echo "----- $FILE_PATH -----"
            cat "$FILE_PATH"
            echo "----- end of file -----"
            ;;

        3)
            if [ -z "$FILE_PATH" ]; then
                echo "No file selected yet. Use Create or Open first."
                continue
            fi

            EDITOR_CMD="${EDITOR:-nano}"
            "$EDITOR_CMD" "$FILE_PATH"
            echo "Finished editing $FILE_PATH"
            ;;

        4)
            if [ -z "$FILE_PATH" ]; then
                echo "No file selected yet. Use Create or Open first."
                continue
            fi

            echo "Would you like to move $(basename "$FILE_PATH") out of $SCRIPT_DIR?"
            # Note: a plain read (not -n 1) is used here on purpose. read -n 1
            # only consumes one character and leaves the Enter keypress
            # sitting in the input buffer, which would corrupt the very
            # next read -p below.
            read -p "Are you sure? (y/n) " -r
            if [[ $REPLY =~ ^[Yy] ]]
            then
                read -p "Enter the destination directory: " DEST_DIR

                if [ ! -d "$DEST_DIR" ]; then
                    echo "$DEST_DIR does not exist."
                    read -p "Create it? (y/n) " -r
                    if [[ $REPLY =~ ^[Yy] ]]
                    then
                        mkdir -p "$DEST_DIR"
                    else
                        echo "Move cancelled. File remains at $FILE_PATH"
                        continue
                    fi
                fi

                mv "$FILE_PATH" "$DEST_DIR/"
                echo "Moved $(basename "$FILE_PATH") to $DEST_DIR"
                FILE_PATH="$DEST_DIR/$(basename "$FILE_PATH")"
            else
                echo "File left in place at $FILE_PATH"
            fi
            ;;

        5)
            echo "Closing. Goodbye."
            exit 0
            ;;

        *)
            echo "Invalid option: $choice"
            ;;
    esac
done
