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
