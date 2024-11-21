# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dima/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Colored man
export LESS_TERMCAP_mb=$'\e[1;95m'
export LESS_TERMCAP_md=$'\e[1;93m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;96m'

# Aliases
alias ls='exa --icons --group-directories-first'
alias la='exa -a --icons --group-directories-first'
alias ll='exa -al --icons --group-directories-first'
alias tree='exa --tree --icons' 
alias cat='batcat'
alias yolo='python3.11 /home/dima/yolo-ai-cmdbot/yolo.py'
alias ghidra='/home/dima/ghidra/ghidraRun'
alias my_ip='ip -c address'

# Neofetch
neofetch

# zplug
source ~/.zplug/init.zsh
zplug load

# CyberGhost Start
function cg_start() {
  echo "Select \u001B[33mSyberGhost\u001B[0m \u001B[32mVPN\u001B[0m Server (1: Cyprus, 2: Malta) :"
  read location
  if [[ $location -eq 1 ]]; then
    echo "Starting \u001B[33mSyberGhost\u001B[0m \u001B[32mVPN\u001B[0m --> Cyprus ..."
    sudo cyberghostvpn --traffic --country-code CY --connect
    notify-send "CyberGhost" "VPN connected --> Cyprus" --icon=cyberghost
  elif [[ $location -eq 2 ]]; then
    echo "Starting \u001B[33mSyberGhost\u001B[0m \u001B[32mVPN\u001B[0m --> Malta ..."
    sudo cyberghostvpn --traffic --country-code MT --connect
    notify-send "CyberGhost" "VPN connected --> Malta" --icon=cyberghost
  fi
}

# CyberGhost Stop
function cg_stop() {
  sudo cyberghostvpn --stop
  notify-send "CyberGhost" "VPN connection TERMINATED" --icon=cyberghost
}

# webpack installation
function install_webpack() {
  echo -e "\n\t  Creating project structure ..."
  mkdir src static
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\t2 folders created  "
  echo -e "\n\t Copying config files into bundler folder ...\n"
  # cp ~/webpack_config/bundler/webpack.common.js ~/webpack_config/bundler/webpack.dev.js ~/webpack_config/bundler/webpack.prod.js bundler/ 
  gdown --folder "https://drive.google.com/drive/folders/1-7TFJ38_Ze1Gwano2yf4x9J2Tet8hVMq"
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\t3 config files now in bundler folder      "
  echo -e "\n\t  Initializing project    \u001B[31m\u001B[0m\n"
  npm init -y 
  echo -e "\n\t  Installing  \u001B[36m󰜫\u001B[0m  ...\n"
  npm install --save-dev webpack webpack-cli webpack-dev-server webpack-merge clean-webpack-plugin copy-webpack-plugin @babel/core @babel/preset-env babel-loader css-loader file-loader html-loader html-webpack-plugin mini-css-extract-plugin portfinder-sync raw-loader style-loader ip sass sass-loader
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  echo -e "\n\tInstalled by  \u001B[31m\u001B[0m  : \u001B[36m󰜫\u001B[0m webpack, \u001B[36m󰜫\u001B[0m webpack-cli, \u001B[36m󰜫\u001B[0m webpack-dev-server, \u001B[36m󰜫\u001B[0m webpack-merge, \u001B[36m󰜫\u001B[0m clean-webpack-plugin, \u001B[36m󰜫\u001B[0m copy-webpack-plugin, \u001B[33m󰨥\u001B[0m @babel/core, \u001B[33m󰨥\u001B[0m @babel/preset-env, \u001B[33m󰨥\u001B[0m babel-loader, \u001B[34m\u001B[0m css-loader, file-loader, \u001B[31m\u001B[0m html-loader, \u001B[31m\u001B[0m html-webpack-plugin, \u001B[34m\u001B[0m mini-css-extract-plugin, portfinder-sync, raw-loader, style-loader, ip, \u001B[35m\u001B[0m sass, \u001B[35m\u001B[0m sass-loader"
  node -e "const packageJson = require('./package.json'); packageJson.scripts = { ...packageJson.scripts, start: 'webpack serve --config ./bundler/webpack.dev.js', build: 'webpack --config ./bundler/webpack.prod.js' }; require('fs').writeFileSync('./package.json', JSON.stringify(packageJson, null, 2));"
  echo -e "\n\t\u001B[33mpackage.json\u001B[0m file was updated successfully by \u001B[32m󰎙\u001B[0m"
  echo -e "\n\n\t\u001B[31m\u001B[0m    \u001B[32mnpm\u001B[0m run start    serve the project"
  echo -e "\n\t\u001B[31m\u001B[0m    \u001B[32mnpm\u001B[0m run build    make a build of the project\n"
}

# TypeScript installation
function install_ts() {
  echo -e "\n\t  Installing  \u001B[34m󰛦\u001B[0m TypeScript  ...\n"
  mkdir TS
  echo "\n\tTS folder created  \n"
  npm install --save-dev typescript
  echo -e "\n\t\u001B[32mSuccess!\u001B[0m"
  node -e "const packageJson = require('./package.json'); packageJson.scripts = { ...packageJson.scripts, tsc: 'tsc' }; require('fs').writeFileSync('./package.json', JSON.stringify(packageJson, null, 2));"
  echo '{ "compilerOptions": { "target": "ES6", "module": "commonjs", "outDir": "src"}, "include": [ "TS/**.ts" ] }' > tsconfig.json
  echo -e "\n\t\u001B[34m󰛦\u001B[0m TypeScript installed\n\t\u001B[33mpackage.json\u001B[0m updated by \u001B[32m󰎙\u001B[0m\n\t\u001B[33mtsconfig.json\u001B[0m created in the project folder"
  echo -e "\n\n\t\u001B[31m\u001B[0m    \u001B[32mnpm\u001B[0m run tsc    compile the project\n"
}

# System update and upgrade
function full_update() {
  echo "\n\t\u001B[33m---\u001B[0m 󱑠  Full system \u001B[33mupdate\u001B[0m and \u001B[33mupgrade\u001B[0m for user \u001B[36m$USER\u001B[0m \u001B[33m---\u001B[0m"
  # Update apt
  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mapt\u001B[0m ..."
  sudo apt update && sudo apt upgrade -y
  echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
  # Update Homebrew
  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mbrew\u001B[0m ..."
  brew update && brew upgrade
  echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
  # Update npm
  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mnpm\u001B[0m ..."
  npm update -g
  echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
  # Update pip
  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mpip3\u001B[0m ..."
  pip install --upgrade $(pip list --outdated | cut -d" " -f1 -s | tail -n +3)
  echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
  # Update zplug
  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mzplug\u001B[0m to be done manually, run: \u001B[32mzplug\u001B[0m update"
  echo "\n\n\t\u001B[33m---\u001B[0m 󱑠  System update complete. \u001B[33m---\u001B[0m\n"
  echo "\n\n\t\u001B[33m---\u001B[0m 󱑠  Обновление системы завершено. \u001B[33m---\u001B[0m\n"
}

# Fly.io
export FLYCTL_INSTALL="/home/dima/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Ghidra
export PATH="~/ghidra/bin:$PATH"

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Starchip
eval "$(starship init zsh)"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/dima/.micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/dima/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
