{ config, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      # Zinit installation and initialization
      if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
      fi

      source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
      autoload -Uz _zinit
      (( ''${+_comps} )) && _comps[zinit]=_zinit

      # Load zinit annexes
      zinit light-mode for \
        zdharma-continuum/zinit-annex-as-monitor \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/zinit-annex-rust

      # Load completion system
      zinit ice wait lucid
      zinit snippet OMZL::completion.zsh

      # Load zsh plugins
      zinit light Aloxaf/fzf-tab
      zinit light zsh-users/zsh-syntax-highlighting
      zinit light zsh-users/zsh-completions
      zinit light zsh-users/zsh-autosuggestions

      # Load Oh My Posh
      zinit ice from"gh-r" as"program" atload'eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"'
      zinit light JanDeDobbeleer/oh-my-posh

      # Load zoxide
      zinit ice wait lucid from"gh-r" as"program" pick"zoxide*/zoxide"
      zinit light ajeetdsouza/zoxide
      eval "$(zoxide init --cmd cd zsh)"

      # Load NVM
      export NVM_DIR="$HOME/.nvm"
      zinit ice wait lucid
      zinit snippet OMZP::nvm

      # Load fzf
      zinit ice from"gh-r" as"program"
      zinit light junegunn/fzf
      zinit ice wait lucid
      zinit snippet OMZP::fzf

      # fzf-tab configuration
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      zstyle ':fzf-tab:*' switch-group ',' '.'
    '';
    shellAliases = {
      ls = "eza";
      l = "eza -lbF --git";
      ll = "eza -lbGF --git";
      llm = "eza -lbGF --git --sort=modified";
      la = "eza -lbhHigUmuSa --time-style=long-iso --git --color-scale";
      lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale";
      lS = "eza -1";
      lt = "eza --tree --level=2";
    };
    history = {
      size = 1000;
      path = "${config.home.homeDirectory}/.histfile";
    };
  };
}