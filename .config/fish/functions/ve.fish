function ve --description 'Create or activate a Python virtual environment'
    set -l venv_name ".venv"
    set -l venv_found 0
    set -l setup_file ".venv_setup_done"

    set -q argv[1] && set venv_name $argv[1]

    function find_and_activate_venv
        for dir in */bin/activate.fish */Scripts/activate.fish
            if test -f $dir
                set venv_path (dirname (dirname $dir))
                source $dir
                return 0
            end
        end
        return 1
    end

    if test -d $venv_name
        source $venv_name/bin/activate.fish
        set venv_found 1
        set venv_path $venv_name
    else if find_and_activate_venv
        set venv_found 1
    end

    if test $venv_found -eq 0
        python -m venv $venv_name
        source $venv_name/bin/activate.fish
        set venv_path $venv_name
    end

    if not test -f $venv_path/$setup_file
        pip install --upgrade pip setuptools wheel >/dev/null
        touch $venv_path/$setup_file
    end
end