#!/bin/bash

bump_version() {
    local version=$1

    # Split the version string into major, minor, and patch segments
    IFS='.' read -ra segments <<< "$version"
    major=${segments[0]}
    minor=${segments[1]}
    patch=${segments[2]}

    # Increment the first patch segment
    patch=$((patch + 1))

    # Check if the patch segment exceeds 100
    if [ "$patch" -gt 100 ]; then
        patch=0
        minor=$((minor + 1))

        # Check if the minor segment exceeds 10
        if [ "$minor" -gt 10 ]; then
            minor=0
            major=$((major + 1))
        fi
    fi

    # Join the segments back into a version string
    bumped_version="${major}.${minor}.${patch}"

    echo "$bumped_version"
}

# Example usage
current_version="1.0.100"
new_version=$(bump_version "$current_version")

echo "Current version: $current_version"
echo "Bumped version: $new_version"
