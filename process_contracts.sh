#!/bin/bash

# --- Configuration ---
# The absolute path to the directory containing your smart contracts.
# IMPORTANT: Make sure there are no spaces at the end of the path.
CONTRACTS_DIR="/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/solidity-baa-contracts"

# The directory where the results will be stored.
RESULTS_DIR="./results_baa_contracts"

# The API key for your tool.
API_KEY="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"

# The name of the temporary directory created by your tool.
TEMP_RESULTS_DIR="./test"

# --- Script Start ---

# Create the main results directory if it doesn't already exist.
# The -p flag ensures no error is thrown if the directory already exists.
echo "Ensuring results directory exists at $RESULTS_DIR..."
mkdir -p "$RESULTS_DIR"

# Check if the contracts directory actually exists before trying to loop through it.
if [ ! -d "$CONTRACTS_DIR" ]; then
    echo "Error: Contracts directory not found at '$CONTRACTS_DIR'"
    exit 1
fi

echo "Starting to process contracts..."

# Loop through every file in the specified contracts directory.
for contract_file in "$CONTRACTS_DIR"/*; do
    # This check ensures we are only processing files, not sub-directories.
    if [ -f "$contract_file" ]; then
        # Get the base name of the file (e.g., "MyContract.sol") for logging.
        contract_name=$(basename "$contract_file")
        
        echo "----------------------------------------------------"
        echo "Processing contract: $contract_name"
        echo "----------------------------------------------------"

        # Execute the Python tool. This is the "try" part.
        # The command will run and the script will wait for it to complete.
        python3 -m solTg.RunAll -i "$contract_file" -t 120 --apiKey "$API_KEY"

        # Check the exit code of the last command.
        # An exit code of 0 means success. Any other number indicates an error.
        if [ $? -eq 0 ]; then
            # This block runs only if the command was successful.
            echo "Successfully processed $contract_name."

            # Check if the temporary results directory was created by the tool.
            if [ -d "$TEMP_RESULTS_DIR" ]; then
                # Create a unique name for the results based on the contract's filename.
                # This removes the .sol extension for a cleaner folder name.
                destination_name=$(basename "$contract_name" .sol)_results
                
                # Move the entire './test' directory into the main results directory
                # and give it the unique name we just created.
                mv "$TEMP_RESULTS_DIR" "$RESULTS_DIR/$destination_name"
                echo "Results moved to '$RESULTS_DIR/$destination_name'"
            else
                echo "Warning: No '$TEMP_RESULTS_DIR' directory was found for $contract_name. Nothing to move."
            fi
        else
            # This is the "catch" part. It runs if the command failed.
            echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            echo "An error occurred while processing $contract_name. Skipping."
            echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        fi
        echo # Adding a blank line for cleaner output between files.

        # Add a 60-second delay before processing the next file.
        echo "Waiting for 60 seconds before processing the next contract..."
        sleep 60
    fi
done

echo "===================================================="
echo "All contracts have been processed. Script finished."
echo "===================================================="

