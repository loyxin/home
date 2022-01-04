# install os

## pre os

```shell
amd-code
mkfs.fat -F32 /dev/sda1

# 进入交互式提示符环境
iwctl
# 接下来是在以 [iwd] 开头的提示符环境中进行的
# 列出所有 WiFi 设备
device list
# 假设刚才的 Name 一列的网络设备名称为 wlan0，接下来扫描网络
station wlan0 scan
# 列出所有可用的网络
station wlan0 get-networks
# 假设想要连到 Network name 一列中，名称为 Xiaomi 的网络
station wlan0 connect Xiaomi
# 然后按照提示输入密码即可

# 启用 NTP 时间同步
timedatectl set-ntp true
# 查看 NTP 服务状态
timedatectl timesync-status
# 设置时区为上海
timedatectl set-timezone Asia/Shanghai
hostnamectl set-hostname loyxin
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 查看时间
date -R
# 将硬件时钟（RTC）调整为与目前的系统时钟一致
hwclock --systohc

systemctl enable openntpd.service

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
eselect locale set "en_US.utf8"
emerge --config sys-libs/timezone-data
# 生成 locale 信息
locale-gen
vim /etc/locale.gen
# 创建 locale.conf 文件，并编辑设定 LANG 变量，不建议弄成中文的，会导致 tty 乱码
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# after install the basic os
sudo grub-install --target=x86_64-efi --efi-directory=/home/loyxin/efi
sudo grub-mkconfig -o efi/EFI/deepin/grub.cfg
修改fstab
genfstab -L /mnt >> /mnt/etc/fstab
grub-install --target=i386-pc /dev/sdx （将sdx换成你安装的硬盘）
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=rty

grub-mkconfig -o /boot/grub/grub.cfg

## add user
useradd -m -G users,wheel,video,audio,portage,usb loyxin
sudo passwd root
visudo
```

## 其他命令
```shell
sudo ifmetric wlx24050f6504d5 1 ## 提高优先级
git submodule update --init --recursive
sudo update-alternatives --config gcc
 efibootmgr  -c -d /dev/nvme0n1 -p 1 -L "deepin-n" -l "/EFI/deepin/grubx64.efi"
# 调整风扇
export DISPLAY=:0
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=$1"
```

## gentoo 安装说明
网站 https://wiki.gentoo.org/wiki/Hardened_Gentoo/zh-cn

它在现有 Gentoo Linux 安装上提供了多种额外的安全服务。虽然这些服务可以分别单独使用，但是 "Gentoo Hardened" 启用了 toolchain 中几个可以降低被攻击风险的选项，支持 PaX, grSecurity, SELinux, TPE 等等功能。

目前使用 https://mirrors.tuna.tsinghua.edu.cn/gentoo/releases/amd64/autobuilds/current-stage3-amd64-systemd/

在安装媒介写一个shell 脚本
```shell
mount 设备
wget https://mirrors.tuna.tsinghua.edu.cn/gentoo/releases/amd64/autobuilds/current-stage3-amd64-systemd/stage3-amd64-systemd-$da.tar.xz ## 下载安装系统
tar xpvf stage3-*.tar.bz2 --xattrs-include='*.*' --numeric-owner # 解压到 目标硬盘

cp -rf /etc/resolv.conf /mnt/gentoo/etc/ #网络
wget -P /mnt/gentoo/etc/portage/  https://raw.githubusercontent.com/rafrozen/rafrozen.github.io/master/page/make.conf # 编译器
wget -P /mnt/gentoo/etc/portage/repos.conf https://raw.githubusercontent.com/rafrozen/rafrozen.github.io/master/page/gentoo.conf
mount /dev/$bootdev /mnt/gentoo/boot
mount -t proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/sys
chroot /mnt/gentoo /bin/bash
# 如何根据信息 生成自己的 make.conf
make_conf(){
    gcc -v -E -x c /dev/null -o /dev/null -march=native 2>&1 | grep /cc1
    sudo dmesg | grep x2apic
    sudo dmesg | grep dma
    sudo dmesg| grep video # kernel

    grep pat /proc/cpuinfo
    grep mpx /proc/cpuinfo
    grep umip /proc/cpuinfo
    cat /proc/cpuinfo| grep mce

    sudo dmidecode
lspci -kb -nn -Q > program/back/etc/home/pci
}

## 安装完了
eselect profile set "default/linux/amd64/17.1/systemd"

# layman add
# gentoo-zh

# USE="pulseaudio"
# emerge -av alsa-lib alsa-utils pulseaudio
```

## install arch linux

```bash
pacstrap /mnt base base-devel linux linux-firmware dhcpcd vim arch-install-scripts reflector
arch-chroot /mnt
sudo reflector -c China --save /etc/pacman.d/mirrorlist --sort rate
pacman -S tmux zsh sudo cmake wget efibootmgr grub clang networkmanager ntfs-3g usbutils conky git python python3 lsof samba tmux ncdu copyq alsa-utils
pacman -S feh i3-gaps sddm xorg neofetch ranger compton alacritty

useradd -m -G users,wheel,video,audio loyxin
visudo

chsh -s /bin/zsh loyxin
pacman -S openssh
vi sshd //passwd x11
sudo pacman -S network-manager-applet deepin-screenshot deepin-font-manager rustup volumeicon blueman hexyl htop network-manager-applet rofi clash feh yarn openntpd
sudo systemctl enable sddm
sudo systemctl enable sshd
sudo systemctl enable NetworkManager
blueman llvm clang mate-system-monitor mate-media bluez deepin-image-viewer vlc dolphin breeze-icons
// alert-git

git clone https://aur.archlinux.org/yay.git
makepkg -si
archlinuxcn 源
[archlinuxcn]
Server = https://mirrors.aliyun.com/archlinuxcn/$arch
Server = https://mirrors.cloud.tencent.com/archlinuxcn/$arch

# 显卡驱动
xorg
```

## deepin
```shell
rm ~/模板 ~/Pictures/* ~/Music/* ~/Videos/* -rf
gsettings set com.deepin.dde.startdde launch-welcome false
```

## samba

```bash
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
```

## jupyter
```bash
    sudo pip3 install jupyter scipy pandas matplotlib ipython
    sudo pip3 install jupyterlab-git jupyter_contrib_nbextensions jupyter-highlight-selected-word jupyterthemes

    jupyter serverextension enable --py jupyterlab_git
    jupyter contrib nbextension install --user
```

## webdav
```bash
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
```

## apt install
```bash
    sudo sed -i 's/deb/\#deb/g' /etc/apt/sources.list
    sudo sed -i '$a\deb [by-hash=force] https://mirrors.sjtug.sjtu.edu.cn/deepin panda main contrib non-free' /etc/apt/sources.list
    sudo apt update
    sudo apt install git python python-dev python3-dev build-essential curl python-pip python3-pip axel zsh oh-my-zsh perl-tk xbuilder mono-xbuild libboost-all-dev lsof samba lighttpd lighttpd-mod-webdav apache2-utils openssh-server autoconf automake curl openssl llvm libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y

    sudo apt install   mycli bpython bpython3 lighttpd doxygen doxygen-latex sqlite3 polipo bash-completion imagemagick graphviz graphviz-dev marp tmux synergy chmsee teamviewer copyq  remarkable bc okular seafile telegram-desktop vlc  sogoupinyin  netease-cloud-music gnome-disk-utility youdao-dict mmv icdiff  code codeblocks codeblocks-dev codeblocks-common pandoc  pandoc-citeproc valgrind vsftpd ncdu tldr cadaver typora mongodb-server mongodb bspwm python3-sdl2 gettext mono-devel python3-tk -y
    sudo apt-get upgrade -y
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool  -y
     echo "apt upgrade" 1>&5
sudo apt install sddm i3blocks  compton feh
# sudo systemctl disable lightdm
# sudo systemctl enable sddm
```

install window  eject linux because windows will demage the linux

tar --one-file-system aviod adding /proc /dev
sudo apt-get remove –purge nvidia*
禁用nouveau
sudo update-initramfs -u
lsmod | grep nouveau  # 没输出代表禁用生效
–no-opengl-files
dkms
出现提示是否使用dkms，选择NO，在secure boot（安全模式）下使用dkms会无法开机
.sign the kernel module
sign the kernel module（内核模块签名），选择它
以root权限执行
mokutil --import /usr/share/nvidia/nvidia*.der
