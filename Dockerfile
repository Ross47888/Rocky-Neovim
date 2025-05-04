FROM rockylinux/rockylinux:8.10
label maintainer="RFG"

# Manage basic Settings and installs
RUN dnf upgrade -y && \
dnf install -y dnf-utils && \
dnf install -y sudo bash zsh curl git-core gnupg wget vim python3 cargo
# nvim
RUN dnf install -y lua-libs
#libtermkey libtree-sitter libvterm luajit luajit2.1-luv msgpack unibilium xsel
# RUN locale-gen en_GB.UTF-8

# Set up user
# RUN useradd -m -p Passwordx1234 -s /bin/zsh legion && \
RUN useradd -m -s /bin/zsh legion && \
echo "legion:password" | chpasswd && \
usermod -aG wheel legion

USER legion
RUN mkdir /home/legion/neovim
COPY ./nvim-linux64.tar.gz /home/legion/neovim/nvim-linux64.tar.gz
COPY ./linker.sh /home/legion/neovim/linker.sh
# RUN chown legion /home/legion/neovim/*
RUN cd ~/neovim && tar -xf ./nvim-linux64.tar.gz nvim-linux64
RUN mkdir -p ~/.local/share/nvim/site/pack/plugins/start ~/dotfiles ~/.config

USER root
COPY ./Plugins.tar.gz /home/legion/.local/share/nvim/site/pack/plugins/start
RUN tar -xvf /home/legion/.local/share/nvim/site/pack/plugins/start/Plugins.tar.gz -C /home/legion/.local/share/nvim/site/pack/plugins/start
COPY ./nvim /home/legion/dotfiles/nvim
RUN ln -s /home/legion/neovim/nvim-linux64/bin/nvim /bin && \
ln -s /home/legion/dotfiles/nvim /home/legion/.config/nvim

USER legion
WORKDIR /home/legion
ENV TERM xterm
CMD ["bash"]
