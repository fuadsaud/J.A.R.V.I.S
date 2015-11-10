set nocompatible
filetype off

" Initialize Vundle

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
" Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

" git
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/gist-vim'
  Plugin 'mattn/webapi-vim'

" general utilities
Plugin 'tpope/vim-vinegar'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'milkypostman/vim-togglelist'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Auto-Pairs'
Plugin 'gregsexton/MatchTag'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'loremipsum'
Plugin 'a.vim'
Plugin 'editorconfig/editorconfig-vim'

" text objects
Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'tommcdo/vim-exchange'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nelstrom/vim-textobj-rubyblock'

" tmux integration
Plugin 'LnL7/vim-tslime'
Plugin 'christoomey/vim-tmux-navigator'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
  " Plugin 'stefanoverna/vim-i18n'
Plugin 'tpope/vim-rake'
  Plugin 'tpope/vim-projectionist.git'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'ngmy/vim-rubocop'

" clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

" haskell
Plugin 'dag/vim2hs'
Plugin 'raichoo/haskell-vim'
Plugin 'hspec/hspec.vim'

" python
Plugin 'hynek/vim-python-pep8-indent'

" javascript
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'itspriddle/vim-jquery'

"java
Plugin 'tfnico/vim-gradle'

" stylesheets
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'

Plugin 'elixir-lang/vim-elixir'
Plugin 'derekwyatt/vim-scala'
Plugin 'jnwhiteh/vim-golang'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-liquid'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-cucumber'
Plugin 'Keithbsmiley/tmux.vim'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'gorodinskiy/vim-coloresque'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'noahfrederick/Hemisu'

call vundle#end()

filetype plugin indent on