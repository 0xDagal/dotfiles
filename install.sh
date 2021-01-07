#/bin/bash

WARNING='\033[1;33m]'
ERROR='\033[1;31m]'
NOCOLOR='\033[0m'
SUCCESS='\033[0;32m'

OS=''
pm=''
package=''
install=0

check_distro(){
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
  elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
  elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
  elif [ -f /etc/debian_version ]; then
    OS=Debian
  elif [ -f /etc/SuSe-release ]; then
    . /etc/Suse-release
    OS=$NAME
  elif [ -f /etc/redhat-release ]; then
    . /etc/redhat-release
    OS=$NAME
  else
    OS=$(uname -s)
  fi
}

check_package_manager() {
  case $OS in
    'Arch Linux' | 'Manjaro Linux')
      pm=pacman
      ;;
    'CentOS Linux')
      pm=yum
      ;;
    'Fedora')
      pm=dnf
      ;;
    'Debian GNU/Linux' | 'Ubuntu')
      pm=apt
      ;;
    'OpenSuse')
      pm=zypper
      ;;
  esac
}

install_alacritty(){
  case $pm in
    pacman)
      $pm -Syu
      $pm -Qq alacritty  2>/dev/null | wc -l
      if [ $? -eq 0 ]; then
        [ $install -eq 1 ] && $pm -S --noconfirm alacritty || $pm -S alacritty
      fi
      stow alacritty
      ;;
    # dnf | yum | apt)
    #   $pm update
    #   $pm list -a --installed alacritty 2>/dev/null | wc -l
    #   if [ $? -eq 0 ]; then
    #     $pm search alacritty
    #     if [ $? -eq 0 ]; then
    #       echo -e "${YELLOW}Seems like your package manager don't have alacritty
    #       ${NOCOLOR}"
    #       res=''
    #       until $res=~[Y|y|N|n|]; do
    #         read -p "Would you like to install it with snap ? [y/N]" res
    #         if [ $res =~ [Y|y] ]; then
    #           snap 2>/dev/null | wc -l
    #           if [ $? -eq 0 ]; then
    #             [ $install -eq 1 ] && $pm install -y snap || $pm install snap
    #           fi
    #             [ $install -eq 1 ] && snap install -y alacritty || snap install alacritty
    #           stow alacritty
    #           echo -e "${SUCCESS} Bravo ! You have alacritty installed !${NOCOLOR}"            
    #         elif [ $res =~ [N|n|] ]; then
    #           echo -e "${YELLOW}Okay you won't have alacritty${NOCOLOR}"
    #         else
    #           echo "${ERROR}Your answer can't be handled correctly retry please
    #           ${NOCOLOR}"
    #         fi
    #       done
    #     else
    #       [ $install -eq 1 ] && $pm install -y alacritty || $pm install alacritty
    #       stow alacritty
    #       echo -e "${SUCCESS} Bravo ! You have alacritty installed !${NOCOLOR}"            
    #     fi
    #   fi
    # ;;
  esac      
}

install_vifm(){
  case $pm in
    pacman)
      $pm -Syu
      $pm -Qq vifm  2>/dev/null | wc -l
      if [ $? -eq 0 ]; then
        res=''
        pip list 2>/dev/null | grep ueberzug | wc -l
        if [ $? -eq 0 ]; then
          until $res=~[Y|y|N|n|]; do
            read -p "To get image preview working you'll need Ueberzug, would you like to have it ? [y/N]"
            if [ $res =~ [Y|y] ]; then
              res=''
              pip 2>/dev/null | wc -l
              if [ $? -eq 0 ]; then
                until $res=~[Y|y|N|n|]; do
                  read -p "To get Ueberzug you'll need pip, would you you like to have it ? [y/N]"
                  if [ $res =~ [Y|y] ]; then
                    [ $install -eq 1 ] && $pm -S --noconfirm pip || $pm -S pip
                    [ $install -eq 1 ] && pip install -y ueberzug || pip install -y ueberzug
                  elif [ $res =~ [N|n|] ]; then
                    echo -e "${YELLOW}Okay you won't have pip nor Ueberzug${NOCOLOR}"
                  else
                    echo "${ERROR}Your answer can't be handled correctly retry please
                    ${NOCOLOR}"
                  fi
                done
              fi
            elif [ $res =~ [N|n|] ]; then
              echo -e "${YELLOW}Okay you won't have Ueberzug${NOCOLOR}"
            else
              echo "${ERROR}Your answer can't be handled correctly retry please
              ${NOCOLOR}"
            fi
          done
          [ $install -eq 1 ] && $pm -S --noconfirm vifm || $pm -S vifm
          stow vifm
          echo -e "${SUCCESS} Bravo ! You have vifm installed !${NOCOLOR}"            
        fi
      fi
      ;;
    # dnf | yum | apt)
    #   $pm update
    #   $pm list -a --installed vifm 2>/dev/null | wc -l
    #   if [ $? -eq 0 ]; then
    #     $pm search vifm
    #     if [ $? -eq 0 ]; then
    #       echo -e "${YELLOW}Seems like your package manager don't have vifm
    #       ${NOCOLOR}"
    #     else
    #       [ $install -eq 1 ] && $pm install -y vifm || $pm install vifm
    #     fi
    #   fi
    #   ;;
  esac      
}

install_awesome(){
  $pm -Syu
  $pm -Qq awesome  2>/dev/null | wc -l
  if [ $? -eq 0 ]; then
    [ $install -eq 1 ] && $pm -S --noconfirm awesome || $pm -S awesome
  fi
  stow awesome
}

install_vim(){
  $pm -Syu
  $pm -Qq vim  2>/dev/null | wc -l
  if [ $? -eq 0 ]; then
    [ $install -eq 1 ] && $pm -S --noconfirm vim || $pm -S vim
  fi
  stow vim
}

install_zsh(){
  chmod +x ./zsh/scripts/ZSH-Powerlevel10k.sh
  ./zsh/scripts/ZSH-Powerlevel10k.sh
}

choose_package(){
  case $package in
    alacritty)
      install_alacritty
      ;;
    vifm)
      install_vifm
      ;;
    awesome)
      install_awesome
      ;;
    vim)
      install_vim
      ;;
    zsh)
      install_zsh
      ;;
    all)
      install_zsh
      install_vim
      install_vifm
      install_alacritty
      install_awesome
      ;;
    ?)
      echo "${ERROR}Invalid argument: $package${NOCOLOR}"
      exit 2
      ;;
  esac
}

check_distro
check_package_manager

optstring=":yh"
while getopts ${optstring} arg; do
  case ${arg} in
    h)
      echo "Usage ./install.sh [options...] package[s]"
      echo "    -y Install packages without asking"
      echo "    -h See this actual help"
      ;;
    y)
      install=1
      ;;
    ?)
      echo -e "${ERROR}Invalid option: -${OPTARG}${NOCOLOR}"
      ;;
  esac
done

for package in "$@"; do
  choose_package
done
