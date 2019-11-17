{ pkgs, ... }:
let allPlugins = pkgs.vimPlugins // pkgs.callPackage ./custom-plugins.nix { };
in {
  programs.neovim = {
    enable = true;

    withPython = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;

    vimAlias = true;

    extraConfig = builtins.readFile ./vimrc;

    plugins = with allPlugins; [
      ale
      candid
      fzf-vim
      fzfWrapper
      gitgutter
      goyo
      gv
      lightline-vim
      neoformat
      polyglot
      quickfix-reflector-vim
      tabnine
      todo
      vim-abolish
      vim-commentary
      vim-dirvish
      vim-eunuch
      vim-fugitive
      vim-repeat
      vim-rhubarb
      vim-signature
      vim-speeddating
      vim-surround
      vim-unimpaired
      visual-star-search
    ];
  };
}
