.vim
====

I use [Neovim](http://neovim.io).  Most of this config was in place before I switched, so it will probably work fine in any modern vim (7.4), but I don't actively test it in classic vim.
Give Neovim a try if you aren't using it!  It's an awesome project.


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
```sh
git clone --recursive git://github.com/spicydonuts/.vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
```
Open vim and install plugins (ignore the warning about not finding lucius colors)
```
vim
(in vim)
:PlugInstall
(close vim when it's done)
```
This includes the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin, which requires an extra command to build (see their README for more info):
```sh
cd ~/.vim/plugged/YouCompleteMe
./install.sh # optional flags: --clang-completer --omnisharp-completer
```
The editorconfig extension also depends on the external `editorconfig` being available.  You can install it with:
```sh
brew install editorconfig
```


Fonts
----
This `.vimrc` uses the excellent [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/) (when in a gui like `macvim` or `gvim`).


Colors
----
Includes [Lucius](https://github.com/spicydonuts/lucius), if you'd like to use it for your terminal as well.  My fork just adds OS X Terminal profiles (iTerm2 is very laggy in my experience).


Thanks
----
Huge thanks to all the plugin authors and StackOverflow answers that made this possible!
