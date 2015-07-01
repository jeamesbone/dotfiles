# Jeames' dotfiles
## Installation

Clone onto your laptop:

```
git clone git://github.com/jeamesbone/dotfiles.git
```

Install rcm:

```
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

```
env RCRC=$HOME/dotfiles/rcrc rcup
```

This command will create symlinks for config files in your home directory. Setting the RCRC environment variable tells rcup to use standard configuration options:

Exclude the README.md and LICENSE files, which are part of the dotfiles repository but do not need to be symlinked in.
Give precedence to personal overrides which by default are placed in ~/dotfiles-local
You can safely run rcup multiple times to update:

rcup
