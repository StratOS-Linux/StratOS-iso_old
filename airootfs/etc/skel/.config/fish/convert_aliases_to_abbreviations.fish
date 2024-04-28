function convert_aliases_to_abbreviations
    # Define the path to the aliases file
    set aliases_file ~/.dotfiles/shells/aliases
    # Read each line from the aliases file
    while read -l line
        # Extract the alias name and command
        set alias_name (echo $line | sed -n 's/^alias \([^=]*\)=.*/\1/p')
        set alias_command (echo $line | sed -n 's/^alias [^=]*=\(.*\)/\1/p')

        # Check if both name and command are extracted
        if test -n "$alias_name" -a -n "$alias_command"
            # Create an abbreviation for the alias
            abbr -a $alias_name $alias_command
        end
    end < $aliases_file
end
