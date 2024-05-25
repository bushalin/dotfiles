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
\*\*Please note that we need to add a `.` in front of the filename. Example:

```bash
$ ln -sf [original filename] [target filename]
$ ln -sf ~/dotfiles/zshrc ~/.zshrc
```

For a nested folder:

```bash
$ ln -sf [original file directory] [target directory]
$ ln -sf ~/dotfiles/config/nvim ~/.config/nvim
```

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
\*\*Please note that we need to add a `.` in front of the filename. Example:

```bash
$ ln -sf [original filename] [target filename]
$ ln -sf ~/dotfiles/zshrc ~/.zshrc
```

For a nested folder:

```bash
$ ln -sf [original file directory] [target directory]
$ ln -sf ~/dotfiles/config/nvim ~/.config/nvim
```

process for a fresh machine

packages:

1. mkdir hasib
2. git clone https://github.com/bushalin/dotfiles.git
3. git fetch origin
4. git checkout neovim_nvchad
5. install homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

6. if wsl update the $PATH to use homebrew

```bash
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
```

7. install zsh
   `sudo apt install zsh`

8. Make zsh as default shell
   `chsh -s ${which zsh}`

9. Install fzf (for fuzzy finding)
   better to install using the official repo install method

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

9. install homebrew packages:

- brew install neovim
- brew install bat
- brew install delta
- brew install eza
- brew install tldr
- brew install thefuck
- brew install zoxide
- brew install starship

10. install tmux plugin manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

11. install the tmux plugins to work with tmux

```
<C-b>I
```

12. install tmuxifier by git cloning:

```
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```
