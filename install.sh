#!/bin/bash

echo "Adding git completion to bash and overwriting vim configuration ..."

cp -v ./custom_bash_profile ~/.custom_bash_profile
cp -v git-completion.bash ~/.git-completion.bash
cp -v vimrc ~/.vimrc


if grep -q "If custom profile exists" ~/.bash_profile; then
    echo "File ~/.bash_profile is aware of custom_bash_profile"
else
    echo "Updating ~/.bash_profile ..."
    cat <<LOAD_CUSTOM_PROFILE >> ~/.bash_profile
# If custom profile exists, load it
if [ -f ~/.custom_bash_profile ]; then
   echo "Loading your custom profile from ~/.custom_bash_profile"
   . ~/.custom_bash_profile
fi
LOAD_CUSTOM_PROFILE
fi

echo "Done."
