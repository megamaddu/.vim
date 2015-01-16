.vim
====

To use this configuration
----

If you already have a `.vim` folder or `.vimrc`, back them up:
```sh
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak
```

Clone the repo and symlink `.vimrc`:
```sh
git clone --recursive git://github.com/spicydonuts/.vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
```

This includes the [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin, which requires an extra command to build (see their `README` for more info):
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.sh # optional flags: --clang-completer --omnisharp-completer
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

Includes [Lucius](https://github.com/spicydonuts/lucius).  My fork adds OS X Terminal profiles.


Disclaimer
----

Only tested in OS X (vim/macvim).
