# Aliases

```bash
# List all aliases
git config --list | grep alias

# Aliases
git config --global alias.aliases '!git config --list | grep alias\. | sort'

# Status
git config --global alias.s       '!git status'

# Add
git config --global alias.a       '!git add .'

# Commit
git config --global alias.cm      '!git commit -m'
git config --global alias.cmwip   '!git commit -m "wip"'

# Log
git config --global alias.lg      '!git log --graph --all --pretty=format:"%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset"'

# Other alternatives
alias.s=status
alias.a=!git add . && git status
alias.au=!git add -u . && git status
alias.aa=!git add . && git add -u . && git status
alias.c=commit
alias.cm=commit -m
alias.ca=commit --amend
alias.ac=!git add . && git commit
alias.acm=!git add . && git commit -m
alias.l=log --graph --all --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset'
alias.ll=log --stat --abbrev-commit
alias.lg=log --color --graph --pretty=format:'%C(bold white)%h%Creset -%C(bold green)%d%Creset %s %C(bold green)(%cr)%Creset %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
alias.llg=log --color --graph --pretty=format:'%C(bold white)%H %d%Creset%n%s%n%+b%C(bold blue)%an <%ae>%Creset %C(bold green)%cr (%ci)' --abbrev-commit
alias.d=diff
alias.master=checkout master
alias.spull=svn rebase
alias.spush=svn dcommit
alias.alias=!git config --list | grep 'alias\.' | sed 's/alias\.\([^=]*\)=\(.*\)/\1\	 => \2/' | sort
```
