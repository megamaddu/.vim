.vim
====

I use [Neovim](http://neovim.io).  Most of this config was in place before I switched, so it will probably work fine in any modern vim (7.4), but I don't actively test it.  I don't want to exclude it yet though, so let me know if something's broken.
Give Neovim a try if you haven't (or another try if you have in the past)!  It's an awesome project.


Goodies
----
* `:term` opens a real terminal in Neovim! (not taking credit, just making sure you know)
* `<C-w>` will get you out of terminal mode and ready to move to another pane (`h`, `j`, `k`, `l`)
* `<leader>` is bound to `;`.
* `;n` and `;b` to jump to next/previous buffers.
* `;w` for a quick save.
* `;x` closes a the current buffer, but not the window or pane it's in.
* `;q` closes the active pane.
* `;Q` closes everything.
* `;<Space>` opens CtrlP.  Partially match a file name and hit `Enter`.  Refresh the file list with `<F5>`.  Move up and down the list with `<C-k>` and `<C-j>`.
* `;e` to `:Eval` the current expression using Fireplace.  Automatically connects to a running Clojure[Script] REPL using `.nrepl-port`.
* `gc` in Visual mode to toggle commenting on the selected lines.

Many more small conveniences and syntax files included.  I'm really picky about performance though, so you won't find any powerline craziness in here!

And go bind your `CapsLock` key to `Esc` for goodness' sake! ([Karabiner](https://pqrs.org/osx/karabiner/) and [Seil](https://pqrs.org/osx/karabiner/seil.html.en))


To use this configuration
----
Clone the repo and symlink `.vimrc` (back up your existing first profile if you have one!):

```shell
git clone --recursive git://github.com/spicydonuts/.vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
```

If you're using neovim, you'll need to symlink your vim config so neovim can see it:

```shell
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

Neovim also requires some python plugins:

```shell
pip2 install neovim
pip3 install neovim
```

Open vim and install plugins (ignore the warning about not finding lucius colors)
```shell
vim
(in vim)
:PlugInstall
(close vim when it's done)
```

This includes the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin, which requires an extra command to build (see their README for more info):
Plug will compile it automatically, so the first install may take a while.

The editorconfig extension also depends on the external `editorconfig` being available.  You can install it with:
```shell
brew install editorconfig
```


Fonts
----
This `.vimrc` uses the [Hasklig](https://github.com/i-tu/Hasklig/) font, which is based on the excellent [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/).
This only applies when in a GUI such as `macvim` or `gvim`.  Running vim in a terminal always uses the terminal's font.


Colors
----
This `.vimrc` comes with [One Dark]() enabled by default, and a few others included which I've used in the past and also like.  Below are links to Terminal color profiles for those themes.  You should match your terminal colors to your vim theme for it to work correctly.  `macvim` is the best way to test a theme without terminal color settings interfering.

* One Dark -- [Terminal.app](https://github.com/nathanbuchar/atom-one-dark-terminal) & [iTerm](https://github.com/joshdick/onedark.vim)
* [Lucius](https://github.com/jonathanfilip/lucius)
* [Solarized Dark](https://github.com/altercation/solarized)


Thanks
----
Huge thanks to all the plugin authors and StackOverflow answers that made this possible!
