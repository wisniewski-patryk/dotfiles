# dotfiles
Hyprland desktop configs managed with GNU Stow.

### How to Use
To create a link, navigate to the repository root in your terminal and run:
```bash
stow <folder_name>
```

### How It Works Under the Hood
Under the hood, `stow` fetches the target root path from the `.stowrc` file (which defaults to `$HOME`). It then recreates the folder structure for each configuration file and generates the appropriate symbolic links.

**Example:** > If you have a `$repo/noctalia` folder with a configuration file located at `./noctalia/.config/noctalia/bar.toml`, running `stow` will go to your `$HOME` directory, check the correct path for `bar.toml`, and create a symlink exactly where it needs to be.

### Installation 
1. install fedora on device: **Fedora 44 Workstation**
2. update packages: `sudo dnf update`
3. add hyprland copr: `sudo dnf copr enable lionheartp/Hyprland`
4. install hyprland and noctalia with greeter:
    `sudo dnf install hyprland noctalia noctalia-greeter`
    or
    `sudo dnf install hyprland-git noctalia-git noctalia-greeter`

5. set greeter in `/etc/greetd/cofnig.conf`
```
[default_session]
command = /usr/bin/noctalia-greeter-session
user = "greeter"
```

6. enable greetd
```
sudo systemctl disable gdm
sudo systemctl enable greetd
```

7. install `stow`
```
sudo dnf install stow
```

8. set configs files
```bash
rm ~/.bashrc ~/.bash_profile
stow bash
stow btop
stow ghostty
stow hypr
stow lazydocker
stow lazygit
rm ~/.local/state/noctalia/settings.toml
stow noctalia
stow nvim
stow systemd
stow tmux
stow vscode
```

9. download tools
```
sudo dnf install neovim
sudo dnf install dotnet-sdk-10.0
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
dotnet tool install --global roslyn-language-server --prerelease
sudo dnf install ghostty
```

10. download [lazygit](https://github.com/jesseduffield/lazygit)
11. set git 
```
git config --global user.email <email_address>
git config --global user.name <name>
git config --global credential.helper store
```
