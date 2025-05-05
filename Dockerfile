FROM rockylinux/rockylinux:8.10
label maintainer="RFG"

# Manage basic Settings and installs
RUN dnf upgrade -y && \
dnf install -y dnf-utils && \
dnf install -y sudo bash zsh curl git-core gnupg wget vim python3 cargo && \
dnf install -y libX11-devel libXft-devel libXext-devel freetype-devel fontconfig-devel harfbuzz-devel && \
dnf groupinstall -y "Development Tools"

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
# RUN mkdir /home/legion/neovim
RUN mkdir /home/legion/neovim -p ~/.local/share/nvim/site/pack ~/dotfiles ~/.config
COPY ./nvim-linux64.tar.gz /home/legion/neovim/nvim-linux64.tar.gz
COPY ./linker.sh /home/legion/neovim/linker.sh
COPY ./nvim /home/legion/dotfiles/nvim
COPY ./plugins.tar.gz /home/legion/.local/share/nvim/site/
RUN cd ~/neovim && tar -xf ./nvim-linux64.tar.gz nvim-linux64
COPY ./st.tar.gz /home/legion/st.tar.gz
RUN cd ~ && tar -xf ./st.tar.gz st

USER root
RUN tar -xf /home/legion/.local/share/nvim/site/plugins.tar.gz -C /home/legion/.local/share/nvim/site/
RUN mv /home/legion/.local/share/nvim/site/plugins/* /home/legion/.local/share/nvim/site/pack/
RUN ln -s /home/legion/neovim/nvim-linux64/bin/nvim /bin && \
ln -s /home/legion/dotfiles/nvim /home/legion/.config/nvim

USER legion
WORKDIR /home/legion
ENV TERM xterm
CMD ["bash"]
