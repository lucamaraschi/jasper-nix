{ pkgs, ... }:
let
  sources = import ../../nix/sources.nix;
  nivSourceAsPlugin = p:
    pkgs.vimUtils.buildVimPlugin {
      name = p.repo;
      src = p;
    };
in {
  programs.neovim = {
    enable = true;

    withPython = false;
    withPython3 = true;
    withRuby = false;
    withNodeJs = false;

    vimAlias = true;

    extraConfig = builtins.readFile ./vimrc;

    plugins = with pkgs.vimPlugins; [
      (nivSourceAsPlugin sources."asyncomplete.vim")
      (pkgs.vimUtils.buildVimPlugin {
        name = "asyncomplete-tabnine";
        src = ../../asyncomplete-tabnine;
      })
      ale
      fzf-vim
      fzfWrapper
      gitgutter
      goyo
      gv-vim
      lightline-vim
      limelight-vim
      neoformat
      nord-vim
      polyglot
      quickfix-reflector-vim
      todo-txt-vim
      vim-abolish
      vim-commentary
      vim-dirvish
      vim-eunuch
      vim-fugitive
      vim-highlightedyank
      vim-illuminate
      vim-localvimrc
      vim-repeat
      vim-rhubarb
      vim-signature
      vim-speeddating
      vim-surround
      vim-unimpaired
      vim-vinegar
      vim-visualstar
    ];
  };
}
