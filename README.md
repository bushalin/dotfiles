# PERSONAL DOTFILES:

This is the dotfiles repositories for the configurations of common applications used.</br>
I will continue to add the files for more automization.

_Description:_
</br>
I tried to mirror the `$HOME` folder of my machine in this repository. If we need to create the symlink, we just need to follow the folder structure of this repo.

Example:

#### Nvim

dotfiles directory: `config/nvim`
</br>
target directory: `{$HOME}/.config/nvim`

### Creating a symlink:
For a single file:
**Please note that we need to add a `.` in front of the filename. Example:

```bash
$ ln -sf [original filename] [target filename]
$ ln -sf ~/dotfiles/zshrc ~/.zshrc
```

For a nested folder:

```bash
$ ln -sf [original file directory] [target directory]
$ ln -sf ~/dotfiles/config/nvim ~/.config/nvim
```
