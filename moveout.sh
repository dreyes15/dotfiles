#!/bin/bash

echo "Staring moving dot-files from remote to your local..."

echo "Moving .vimrc..."
cp ./.vimrc ~/.
echo "Done"

echo "Moving vim folder .vim"
cp -r ./.vim ~/.
echo "Done"

#echo "Moving CTF scripts"
#cp -r ./scripts ~/
#echo "Done"

#echo "Moving .ctags..."
#cp ./.ctags ~/.
#echo "Done"

echo "Moving .gitconfig"
cp ./.gitconfig ~/.
echo "Done"

echo "Moving .gitignore_global"
cp ./.gitignore_global ~/.
echo "Done"

#echo "Moving .zshrc..."
#cp ./.zshrc ~/.
#echo "Done"

echo "Moving .tmux.conf..."
cp ./.tmux.conf ~/.
echo "Done"

echo "Moving .tmux_theme.."
cp ./.tmux_theme ~/.
echo "Done"

#echo "Moving .dircolors..."
#cp ./.dircolors ~/.
#echo 'Done'

#echo "Moving install.sh"
#cp ./install.sh ~/
#echo "Done"

echo "Moving test.sh"
cp ./test.sh ~/
echo "Done"
