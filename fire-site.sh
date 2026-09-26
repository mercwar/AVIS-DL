#!/bin/bash
# IDENTITY: VERSION 4.0 // FIRE-SITE // CVBGOD fire-site.sh
# ROLE: Dynamic Root-Folder Sitemap Generation with URL Encoding for GitHub Actions.

# Check if running in GitHub Actions and ensure it was triggered manually (workflow_dispatch)
if [ "$GITHUB_ACTIONS" = "true" ] && [ "$GITHUB_EVENT_NAME" != "workflow_dispatch" ]; then
    echo "Skipping sitemap generation: This script is configured to only run on manual (workflow_dispatch) triggers."
    exit 0
fi

# 1. Get the base GitHub URL from your git config
REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//' | sed 's/git@github.com:/https:\/\/github.com\//')
BRANCH="main"
BASE_URL="${REPO_URL}/tree/${BRANCH}" # Changed /blob/ to /tree/ since these are folders

OUTPUT_FILE="sitemap.xml"

echo "Generating sitemap for root folders at: ${BASE_URL}"

# 2. Start the XML structure
echo '<?xml version="1.0" encoding="UTF-8"?>' > $OUTPUT_FILE
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> $OUTPUT_FILE

# 3. Find only root-level directories (maxdepth 1), excluding hidden ones like .git
find . -maxdepth 1 -type d -not -name '.' -not -name '.*' | while read -r dir; do
    # Remove the leading './'
    CLEAN_PATH="${dir#./}"
    
    # URL encode spaces
    ENCODED_PATH=$(echo "$CLEAN_PATH" | sed 's/ /%20/g')
    
    # Write the URL entry
    echo "  <url>" >> $OUTPUT_FILE
    echo "    <loc>${BASE_URL}/${ENCODED_PATH}</loc>" >> $OUTPUT_FILE
    echo "  </url>" >> $OUTPUT_FILE
done

# 4. Close the tag
echo '</urlset>' >> $OUTPUT_FILE

echo "Done! Root folder sitemap saved to $OUTPUT_FILE"
