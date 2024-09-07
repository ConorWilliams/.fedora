# My .config

This is my config for Fedora (40) - sway spin

## General/OS

### Core installs

```sh
sudo dnf install vim fish git
```

Set fish as the default shell:

```sh
chsh -s /usr/bin/fish
```

### Fixing trackpad on sway

### Github keys

Make a key on githuhub and install locally, enable agent in fish:

```sh
eval (ssh-agent -c) && ssh-add ~/.ssh/github
```

### Dotfiles

My dotfiles are managed as suggested at [this site](https://www.atlassian.com/git/tutorials/dotfiles)

Add `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'` to fish config.

Init a bare repo:

```sh
git init --bare $HOME/.cfg
config config --local status.showUntrackedFiles no
```
Now I use the `config` alias to manage the configs.

In the future I can do:

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
```sh
echo ".cfg" >> .gitignore
```
Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
```sh
git clone --bare <git-repo-url> $HOME/.cfg
```
Define the alias in the current shell scope:
```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Checkout the actual content from the bare repository to your $HOME:
```sh
config checkout
```
The step above might fail with a message like:
```sh
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
Re-run the check out if you had problems:
```sh
config checkout
```
Set the flag showUntrackedFiles to no on this specific (local) repository:
```sh
config config --local status.showUntrackedFiles no
```
You're done, from now on you can now type config commands to add and update your dotfiles

## Programs

### Chrome

From [tutorial](https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/)

1. sudo dnf install fedora-workstation-repositories
2. sudo dnf config-manager --set-enabled google-chrome
3. sudo dnf install google-chrome-stable


### Obsidian
### Email
### Onedrive
