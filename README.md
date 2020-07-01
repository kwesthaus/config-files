# kwesthaus's configuration files

This repository includes my user dotfiles, as well as other files outside of ~/
that I consider a crucial part of my system.

I use [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) to manage
the configuration files across the filesystem at a single point of change.

I use a detailed .gitignore in an attempt to avoid sharing secrets on GitHub.

Some files in this repository end with *.bak. When installing Arch Linux, I
chose to have an encrypted disk via LVM on LUKS with separate / and /home
partitions. Because I store my configuration files in ~/, this choice
unfortunately means that some of the configuration files on the / partition
cannot be symlinked because the /home partition is not yet ready when the
configuration file is first accessed. As a temporary workaround, I symlink the
file with an added .bak extension and manually overwrite the actual file when
it needs updating. The next time I reinstall I will keep / and /home on the same
partition.
