function which
    set cmd $argv[1]
    set alias_cmd (alias | rg "^alias $cmd ")
    set alias_target (echo $alias_cmd | awk '{$1=""; $2=""; print}')
    set str (echo $alias_target | tr -d ' ')
    if test -n $str
        echo -n "$cmd: aliased to"
        set_color cyan
        echo $alias_target | tr -d "'"
        set_color normal
    end

    if rg "function $cmd" $HOME/.dotfiles/shells/fish/config.fish >/dev/null
	functions $cmd
    end

    # Check if the function is defined in the functions directory
    set func_file $HOME/.dotfiles/shells/fish/functions/$cmd.fish
    if test -f $func_file
	functions $cmd
    end
    set -l exec (command -v $cmd)
    set str2 (echo $exec | tr -d ' ')
    if test -n $str2
	echo -n "$cmd: found in "
        set_color cyan
        echo $exec
        set_color normal
    end
end
