function venv
  set current_path (pwd)
  while [ $current_path != "/" ]
    set venv_path $current_path/.venv/bin/activate.fish
    if test -e $venv_path
      echo "Activating venv in \"$current_path\"."
      . $venv_path
      return
    end
    set current_path (dirname $current_path)
  end

  echo "No virtualenv found."
end

