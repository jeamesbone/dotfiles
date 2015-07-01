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

You can safely run rcup multiple times to update:

```
rcup
```
