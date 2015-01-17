.vim
====


Screenshot in 'zen' mode:
![screenshot](https://raw.githubusercontent.com/spicydonuts/.vim/master/example.png)


Goodies
----
* `<leader>` is bound to `;`.
* `;n` and `;b` to jump to next/previous buffers.
* `;w` for a quick save.
* `;x` closes a the current buffer, but not the window or pane it's in.
* `;q` closes everything.
* `<F3>` toggles 'zen' mode.
* `;ff` opens CtrlP.  Partially match a file name and hit `Enter`.  Refresh the file list with `<F5>`.  Move up and down the list with `<C-k>` and `<C-j>`.
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
This includes the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin, which requires an extra command to build (see their README for more info):
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.sh # optional flags: --clang-completer --omnisharp-completer
```
The editorconfig extension also depends on the external `editorconfig` being available.  You can install it with:
```sh
brew install editorconfig
```


To pull updates later:
----
Pull updates:
```sh
cd ~/.vim && git pull && git submodule update --recursive
```
Then re-run the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) installer as shown above.


Fonts
----
This `.vimrc` uses the excellent [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/).


Colors
----
Includes [Lucius](https://github.com/spicydonuts/lucius), if you'd like to use it for your terminal as well.  My fork just adds OS X Terminal profiles (iTerm2 is very laggy in my experience).


Thanks
----
Huge thanks to all the plugin authors and StackOverflow answers that made this possible!


Disclaimer
----
Only tested in OS X (vim/macvim).
