
#!/bin/bash
help(){
}


jupyter()
{
    sudo pip3 install jupyter scipy pandas matplotlib ipython
    sudo pip3 install jupyterlab-git jupyter_contrib_nbextensions jupyter-highlight-selected-word jupyterthemes

    jupyter serverextension enable --py jupyterlab_git
    jupyter contrib nbextension install --user
}

samba()
{
    echo "samba install"
    sudo cp /home/loyxin/program/back/etc/smb.conf /etc/samba/
    rm /home/loyxin/program/back/etc/smb.conf
    sudo ln /etc/samba/smb.conf /home/loyxin/program/back/etc/smb.conf
    echo "samba passwd\n"
    sudo smbpasswd -a loyxin
    sudo service smbd restart
    echo "samba complete" 
}

webdav()
{
    echo "webdav install"
    sudo chown www-data:www-data /var/run/lighttpd/
    sudo lighty-enable-mod auth
    sudo lighty-enable-mod webdav
    sudo mkdir -p /var/www/web1/web
    sudo chown www-data:www-data /var/www/web1/web
    echo "webdav passwd\n"
    sudo htpasswd -c /var/www/passwd.dav loy
    sudo chown root:www-data /var/www/passwd.dav
    sudo chmod 640 /var/www/passwd.dav
    sudo cp /home/loyxin/program/back/etc/lighttpd.conf /etc/lighttpd/
    rm /home/loyxin/program/back/etc/lighttpd.conf
    sudo ln /etc/lighttpd/lighttpd.conf /home/loyxin/program/back/etc/lighttpd.conf
    cadaver http://localhost/webdav/
    echo "webdav complete" 

    # linux - 查看端口被什么程序占用
    # netstat -tnlp | grep :22
    # lsof -i tcp:22
}




app_emerge(){
      sudo emerge sys-apps/lsd
    cargo install  bat topgrade fd-find
    emerge dev-perl/Tk  dev-db/mongodb net-ftp/vsftpd vlc ncdu lsof  teamviewer copyq telegram-desktop-bin  google-chrome  wqy-zenhei wqy-microhei scrot --autounmask-write
    git clone https://github.com/jech/polipo
    cd polipo
    make
    sudo make install
    systemctl enable polipo
    sudo layman -a gentoo-zh
    sudo emerge media-sound/netease-cloud-music sogoupinyin
    sudo systemctl enable vsftpd
    sudo systemctl enable  mongodb
    sudo layman -o http://gpo.zugaina.org/lst/gpo-repositories.xml -L
    sudo /usr/bin/git clone https://github.com/microcai/gentoo-zh.git /var/lib/layman/gentoo-zh
    sudo layman -a gentoo-zh
    sudo emerge teamviewer netease-cloud-music
    sudo emerge sys-apps/pciutil sys-apps/usbutils htop iotop nettop dig bind-tools  yeganesh redeclipse vokoscreen stellarium psensor bleachbit xflux-gui peek
    git clone https://gitlab.com/wavexx/screenkey
    sudo systemctl enable snapd.socket
    sudo systemctl restart snapd.service
    sudo systemctl restart snapd.socket
    sudo snap install mathpix-snipping-tool
sudo USE="gles2" emerge --ask  qtgui qtwidgets qtprintsupport qtmultimedia qtdeclarative qtopengl
sudo systemctl enable teamviewerd.service
	# bind-tools dmidecode
    wget https://github.com/jech/polipo/archive/polipo-1.1.1.tar.gz
    x polipo-1.1.1.tar.gz
    cd polipo-polipo-1.1.1
    make -j8 && sudo make install
    sudo emerge --config dev-db/mysql
    sudo emerge  nodejs
    sudo layman -a steam-overlay
}


font(){
    symbola
    https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.0.0
    PowerlineSymbols
    neovim clipboard
}

tool(){
    # gvm instal go gentoo emerge go
    # bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    #
    # go get github.com/jesseduffield/lazygit
    # gogs
    # https://blog.mynook.info/post/host-your-own-git-server-using-gogs/


    #rust
    
    rustup install stable
    rustup default stable
    cargo install fd-find
    https://github.com/sharkdp/bat
    https://github.com/so-fancy/diff-so-fancy
    https://github.com/poemdistance/ScreenTranslation
    # nodejs
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    nvm install node
    npm install -g arch-wiki-man
    # npm install -g terminalizer 记录您终端活动并且生成 Gif 图像的工具
    npm install -g diff-so-fancy

curl -sL https://github.com/dotboris/alt/raw/master/install.sh | bash -s

mathpix-snipping-tool 
.fzf/install --key-bindings  --no-bash  --no-fish
}

# udiskie wps-office pacman yaourt x11-drivers/xf86-input-evdev app-vim/rust-vim

# sudo emerge -a deepin-boot-maker  deepin-image-viewer nodeepin-picker  deepin-movie-reborn nodeepin-screen-recorder pcmanfm
# simplesreenrecoder


#!/bin/bash
## open after install must manually install
# deepin loyxin
## import change 17.1

emergy @world
emergy sys-kernel/gentoo-sources
/usr/portage/scripts/bootstrap.sh
echo "kernel code complete" 1>&5 
# to compile kernel
system_emerge
wm_emerge
systemd_enable
echo "loyxin passwd"
visudo
fi


echo "jdk google-chromed mathematica  teamviewer netease telegram jetbrains toolbox latex" 1>&5
echo "please read /tmp/manu_install"

apt_install(){
    sudo sed -i 's/deb/\#deb/g' /etc/apt/sources.list
    sudo sed -i '$a\deb [by-hash=force] https://mirrors.sjtug.sjtu.edu.cn/deepin panda main contrib non-free' /etc/apt/sources.list
    sudo apt update
    sudo apt install git python python-dev python3-dev build-essential curl python-pip python3-pip axel zsh oh-my-zsh perl-tk xbuilder mono-xbuild libboost-all-dev lsof samba lighttpd lighttpd-mod-webdav apache2-utils openssh-server autoconf automake curl openssl llvm libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y

    sudo apt install   mycli bpython bpython3 lighttpd doxygen doxygen-latex sqlite3 polipo bash-completion imagemagick graphviz graphviz-dev marp tmux synergy chmsee teamviewer copyq  remarkable bc okular seafile telegram-desktop vlc  sogoupinyin  netease-cloud-music gnome-disk-utility youdao-dict mmv icdiff  code codeblocks codeblocks-dev codeblocks-common pandoc  pandoc-citeproc valgrind vsftpd ncdu tldr cadaver typora mongodb-server mongodb bspwm python3-sdl2 gettext mono-devel python3-tk -y
    sudo apt-get upgrade -y
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool  -y
     echo "apt upgrade" 1>&5
}
sudo apt install sddm i3blocks  compton feh
# sudo systemctl disable lightdm
# sudo systemctl enable sddm
# lm-sensors
}

system_emerge(){
    emerge @world
    emerge dev-libs/libffi
    USE="sqlite" emergy dev-lang/python:2.7
    USE="sqlite" emergy -u dev-lang/python

    emerge -u sudo autoconf automake bash-completion  cmake app-admin/sysklogd sys-process/cronie layman  zsh wget sys-boot/grub:2 sys-boot/efibootmgr genfstab dev-lang/go sys-devel/clang dev-erlang/sqlite3 dev-db/mysql --automask-write
    etc-update
    emerge -u sudo autoconf automake bash-completion  cmake app-admin/sysklogd sys-process/cronie layman  zsh wget sys-boot/grub:2 sys-boot/efibootmgr genfstab dev-lang/go sys-devel/clang dev-erlang/sqlite3
    emerge networkmanager terminology dev-db/mysql --automask-write
	# roxterm
	# volumeicon dmenu rofi
    etc-update
    emerge networkmanager terminology
    USE="python" emerge neovim neovim-python-client vim
    emerge -C nano
    USE="lzma" emerge  sys-apps/kmod
    depmod

    ## import
    emerge -u  x11-drivers/xf86-video-intel  fcitx fcitx-googlepinyin --autounmask-write 

	# eselect vi set "nvim"
	# eselect editor set "/usr/bin/vi"
	# xdg-settings set default-web-browser  google-chrome.desktop
	#emerge --ask app-portage/gentoolkit
	# emerge udiskie snapd
	# sudo layman -o http://gpo.zugaina.org/lst/gpo-repositories.xml -L
 	# sudo emerge snapd conky cmake avahi-compat ntfs3g
}

wm_emerge(){
    emerge feh i3-gaps i3blocks i3status  sddm --automask-write
    USE="png jpeg" emerge imlib2
    USE="opengl" emerge compton
    etc-update
    emerge feh i3-gaps i3blocks i3status  sddm
    emerge media-libs/gst-plugins-good
    emerge qtgraphicaleffects
    USE="alsa gsteamer qml widgets gles2 openal" emerge  qtmultimedia
    USE="gstreamer" emerge media-libs/phonon
	emerge alsa-lib alsa-utils pulseaudio
	sudo USE="X imlib fbcon" emerge -N w3mimgfb w3m

}


home_set(){
cd ~
git init
git remote add origin /tmp/ty/move/git/rafrozen/backup.git
git pull origin master
git submodule update --init --recursive 
mkdir -p ~/.config/i3 ~/.config/neofetch  
rm ~/.config/i3/* ~/.config/neofetch/* ~/.config/ranger/* ~/.config/terminology/*
ln ~/program/back/etc/home/i3/config  ~/.config/i3/config
ln ~/program/back/etc/home/neofetch/config.conf /home/loyxin/.config/neofetch/config.conf
ln ~/program/back/etc/home/compton.conf  ~/.config/compton.conf
ln ~/program/back/etc/home/alacritty.yml ~/.config/alacritty/alacritty.yml
ln ~/program/back/etc/home/polybar ~/.config/polybar/config
ln ~/program/back/etc/home/polybarlaunch.sh  ~/.config/polybar/launch.sh
}

etc_set(){
# mv xorg
# sudo ln /etc/X11/xorg.conf ./xorg.conf
mv -f /home/loyxin/program/back/etc/motd /etc/
ln /etc/motd /home/loyxin/program/back/etc/motd
mv -f /home/loyxin/program/back/etc/smb.conf /etc/samba/
ln /etc/samba/smb.conf /home/loyxin/program/back/etc/smb.conf
cp -f /home/loyxin/program/back/etc/polipo/config /etc/polipo/
mv -f /home/loyxin/program/back/etc/lighttpd.conf /etc/lighttpd/
mv -f /home/loyxin/program/back/etc/vsftpd.chroot_list /home/loyxin/program/back/etc/vsftpd.conf /etc
ln /etc/vsftpd.chroot_list /home/loyxin/program/back/etc/vsftpd.chroot_list
ln /etc/vsftpd.conf /home/loyxin/program/back/etc/vsftpd.conf
mv -f /home/loyxin/program/back/etc/home/rootprofile /root/.profile
ln /root/.profile /home/loyxin/program/back/etc/home/rootprofile
rm /home/loyxin/.profile
ln /home/loyxin/program/back/etc/home/rootprofile /home/loyxin/.profile
cp /home/loyxin/program/back/etc/home/cron /var/spool/cron/crontabs/loyxin
ln /home/loyxin/program/back/etc/sddm.conf /etc/sddm.conf
git clone https://github.com/3ximus/aerial-sddm-theme
mv aerial-sddm-theme /usr/share/sddm/themes/aerial
git clone https://github.com/Eayu/sddm-theme-clairvoyance
sudo mv sddm-theme-clairvoyance /usr/share/sddm/themes/clairvoyance
echo "sddm clairvoyance-deepin aerial-gentoo" 1>&5
}
