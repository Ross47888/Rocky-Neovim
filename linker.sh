#!/bin/bash

tar -xvf nvim-linux64.tar.gz nvim-linux64

ln -s /home/legion/neovim/nvim-linux64/bin/nvim /bin
mkdir /home/legion/.config/
mkdir /home/legion/.config/nvim
ln -s ./nvim /home/legion/.config/nvim
