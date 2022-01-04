#!/bin/sh
echo "zsh"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
mkdir ~/.oh-my-zsh/themes/lib -p
curl https://raw.githubusercontent.com/dracula/zsh/master/lib/async.zsh >~/.oh-my-zsh/themes/lib/async.zsh
curl https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme >~/.oh-my-zsh/themes/dracula.zsh-theme
echo "zsh complete"

mkdir -p ~/.vim/bundle/files/{backup,swap,info,undo}
mkdir -p ~/.vim/bundle/repos
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "chsh -s /bin/zsh"

# ssh-keygen -t rsa -C "rafrozenluoxin@gmail.com"

# echo "synergy code: 7B76313B70726F3B6C6F793B353B6C6F794078696E2E78696E3B736A74753B303B307D" 1>&5

# root link
# .zshrc .vimrc .zshset .oh-my-zsh .vim

ln ~/bin/conf/alacritty.yml ~/.config/alacritty.yml
ln ~/bin/conf/compton.conf ~/.config/compton.conf
ln -s ~/bin/conf/neofetch ~/.config/neofetch
ln -s ~/bin/conf/ranger ~/.config/ranger
ln -s ~/bin/conf/polybar ~/.config/polybar
ln -s ~/bin/conf/i3 ~/.config/i3
cp -r ~/bin/conf/background ~/.config/.background
cp ~/bin/conf/conkyrc ~/.conkyrc

echo "need passwd"
sudo ln ~/bin/conf/sddm.conf /etc/sddm.conf
echo "install sddm theme"
sudo pacman -S gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia
git clone https://github.com/3ximus/aerial-sddm-theme.git
sudo mv aerial-sddm-theme /usr/share/sddm/themes/aerial

sudo pacman -S cmake llvm neofetch ranger ncdu yay yarn acpilight conky simplescreenrecoder screenkey w3m
# screenkey 键盘记录 https://gitlab.com/wavexx/screenkey
# simplescreenrecoder 一款让你能够从你的屏幕录制简短的动画 GIF 图片
# peek 一款让你能够从你的屏幕录制简短的动画 GIF 图片
# virtscreen romote screen

# ARRAY /dev/md0 metadata=1.2 name=loyxin:0 UUID=131a200b:49c79a36:67bce040:30c55e7f
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# sudo reflector -c China --save /etc/pacman.d/mirrorlist --sort rate

sudo pacman -S --needed nerd-fonts-fira nerd-fonts-fira-code noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra deepin-screenshot deepin-font-manager

sudo pacman -S dmenu alsa-utils alsa-firmware alsa-plugins fcitx-googlepinyin fcitx-qt5 fcitx-configtool clash powerline-fonts pcmanfm yay lsd xorg-xbacklight
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo pacman -S fd ripgrep dust procs wqy-microhei adobe-source-han-sans-cn-fonts ttf-nerd-fonts-symbols dmenu
sudo pacman -S ccls mate-media dolphin
sudo pacman -S adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-sans-fonts adobe-source-serif-fonts w3m ttf-font-awesome
sudo systemctl enable bluetooth.service
# vint shellcheck cmakelint shfmt cmake-format python-pip npm i -g bash-language-server
# npm i -g js-beautify
# gofmt rustfmt luafmt latexindent.pl
# lsd
