#!/bin/bash

# Output file
output_file="merged_output.md"

# Initialize the output file
echo "# Combined Content of .md and .py Files" > "$output_file"
echo "" >> "$output_file"

# Iterate through all directories and files
for dir in $(find . -type d); do
    echo "## Processing Directory: $dir" >> "$output_file"
    echo "" >> "$output_file"

    # Process all .md files
    for md_file in $(find "$dir" -maxdepth 1 -type f -name "*.md" 2>/dev/null); do
        echo "### File: $(basename "$md_file")" >> "$output_file"
        echo '```markdown' >> "$output_file"
        cat "$md_file" >> "$output_file"
        echo '```' >> "$output_file"
        echo "" >> "$output_file"
    done

    # Process all .py files
    for py_file in $(find "$dir" -maxdepth 1 -type f -name "*.py" 2>/dev/null); do
        echo "### File: $(basename "$py_file")" >> "$output_file"
        echo '```python' >> "$output_file"
        cat "$py_file" >> "$output_file"
        echo '```' >> "$output_file"
        echo "" >> "$output_file"
    done
done

echo "Merged content written to $output_file."

