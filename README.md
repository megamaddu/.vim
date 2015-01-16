.vim
====

To use this configuration
----

If you already have a `.vim` folder, back it up:
```sh
mv ~/.vim ~/.vim.bak
```

Clone the repo:
```sh
git clone --recursive git://github.com/spicydonuts/.vim.git ~/.vim
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
