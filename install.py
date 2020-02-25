#!/usr/bin/env python
import os
from pathlib import Path

def link(source, target):
    try:
        target.symlink_to(source)
        print(f"{target} -> {source}")
    except FileExistsError:
        print(f"File {target} already exists")


# Get absolute path to directory of this script
cwd = Path(__file__).resolve().parent

# Make a symlink in ~ to each file/directory in cwd/home
for f in (cwd / 'home').iterdir():
    target = Path.home() / f.name
    link(f, target)

# Make a symlink in ~/.config to each file/directory in cwd/home-config
config = Path.home() / '.config'
config.mkdir(mode=0o700, exist_ok=True)
for f in (cwd / 'home-config').iterdir():
    target = config / f.name
    link(f, target)

# Make a symlink in ~/.gnupg to each file/directory in cwd/home-gnupg
# XXX duplicate code
config = Path.home() / '.gnupg'
config.mkdir(mode=0o700, exist_ok=True)
for f in (cwd / 'home-gnupg').iterdir():
    target = config / f.name
    link(f, target)

# Some extra stuff
(Path.home() / '.vim-swapfiles').mkdir(mode=0o700, exist_ok=True)

# Import dconf settings
os.system(f'dconf load / < {cwd}/dconf-settings.ini')
