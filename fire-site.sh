#!/bin/bash
# IDENTITY: VERSION 4.1 // FIRE-SITE // CVBGOD fire-site.sh
# ROLE: Dynamic Root File & Folder Sitemap Generation with URL Encoding for GitHub Actions.

# Check if running in GitHub Actions and ensure it was triggered manually (workflow_dispatch)
if [ "$GITHUB_ACTIONS" = "true" ] && [ "$GITHUB_EVENT_NAME" != "workflow_dispatch" ]; then
    echo "Skipping sitemap generation: This script is configured to only run on manual (workflow_dispatch) triggers."
    exit 0
fi

# 1. Get the base GitHub URL from your git config
REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//' | sed 's/git@github.com:/https:\/\/github.com\//')
BRANCH="main"
BASE_URL="${REPO_URL}"

OUTPUT_FILE="sitemap.xml"

echo "Generating sitemap for root files and folders..."

# 2. Start the XML structure
echo '<?xml version="1.0" encoding="UTF-8"?>' > $OUTPUT_FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $OUTPUT_FILE

# 3. Find only root-level items (maxdepth 1), excluding hidden ones
find . -maxdepth 1 -not -name '.' -not -name '.*' | while read -r item; do
    # Remove the leading './'
    CLEAN_PATH="${item#./}"
    
    # URL encode spaces
    ENCODED_PATH=$(echo "$CLEAN_PATH" | sed 's/ /%20/g')
    
    # Determine the correct GitHub path prefix based on whether it is a directory or a file
    if [ -d "$item" ]; then
        TARGET_URL="${BASE_URL}/tree/${BRANCH}/${ENCODED_PATH}"
    else
        TARGET_URL="${BASE_URL}/blob/${BRANCH}/${ENCODED_PATH}"
    fi
    
    # Write the URL entry
    echo "  <url>" >> $OUTPUT_FILE
    echo "    <loc>${TARGET_URL}</loc>" >> $OUTPUT_FILE
    echo "  </url>" >> $OUTPUT_FILE
done

# 4. Close the tag
echo '</urlset>' >> $OUTPUT_FILE

echo "Done! Root files and directories saved to $OUTPUT_FILE"
