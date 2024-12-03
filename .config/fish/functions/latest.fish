function latest
    # Display the 5 most recently created files in the specified or current directory.

    # Default to the current directory
    set dir .

    # Check if a directory argument is provided
    if test (count $argv) -ge 1
        set dir $argv[1]
    end

    # Validate directory
    if not test -d $dir
        echo "Error: Directory '$dir' does not exist."
        return 1
    end

    eza -l --sort=created --reverse --icons --color=always "$dir" | head -n 5
end