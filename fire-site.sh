#!/bin/bash
# IDENTITY: VERSION 4.2 // FIRE-SITE // CVBGOD fire-site.sh
# ROLE: Dynamic Root-Only Sitemap Generation with URL Encoding for Version 1 Spaces.

# Check if running in GitHub Actions and ensure it was triggered manually (workflow_dispatch)
if [ "$GITHUB_ACTIONS" = "true" ] && [ "$GITHUB_EVENT_NAME" != "workflow_dispatch" ]; then
    echo "Skipping sitemap generation: This script is configured to only run on manual (workflow_dispatch) triggers."
    exit 0
fi

# 1. Get the base GitHub URL from your git config
REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//' | sed 's/git@github.com:/https:\/\/github.com\//')
BRANCH="main"
BASE_URL="${REPO_URL}/blob/${BRANCH}"

OUTPUT_FILE="sitemap.xml"

echo "Generating sitemap for: ${BASE_URL}"

# 2. Start the XML structure
echo '<?xml version="1.0" encoding="UTF-8"?>' > $OUTPUT_FILE
echo '<urlset xmlns="http://sitemaps.org">' >> $OUTPUT_FILE

# 3. Find files only at the root level (no recursion)
# -maxdepth 1: limit scanning to root | -type f: only files | -not -name '.*': skip hidden configuration files
find . -maxdepth 1 -type f -not -name '.*' | while read -r file; do
    # Remove the leading './'
    CLEAN_PATH="${file#./}"
    
    # URL encode spaces (important for 'Version 1' folders)
    ENCODED_PATH=$(echo "$CLEAN_PATH" | sed 's/ /%20/g')
    
    # Write the URL entry
    echo "  <url>" >> $OUTPUT_FILE
    echo "    <loc>${BASE_URL}/${ENCODED_PATH}</loc>" >> $OUTPUT_FILE
    echo "  </url>" >> $OUTPUT_FILE
done

# 4. Close the tag
echo '</urlset>' >> $OUTPUT_FILE

echo "Done! Full sitemap saved to $OUTPUT_FILE"
