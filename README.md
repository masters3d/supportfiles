# supportfiles
Support files I need to run my peripherals under windows


# Steps for Apple Magic Mouse
- Use the driver from bootcamp.  
https://www.linickx.com/apple-magic-mouse---fixing-windows-10-scrolling  
https://support.apple.com/en-am/HT204048  
https://kevinbecker.org/blog/2012/09/17/reverse-scrolling-on-windows-8  
- Change the "Choose how many lines to scroll each time" to 1.
- Windows does not have elastic scrolling so even that setting will feel weird because the mouse will stop scrolling right away when you let go.
- Reverse scrolling using this: https://github.com/jamie-pate/flipflop-windows-wheel

# Map the windows key to CRL
- https://www.howtogeek.com/howto/windows-vista/map-any-key-to-any-key-on-windows-xp-vista/

# Git Settings
This fixes the line ending so you can use the git from inside bash ubuntu in windows.
`git config --global core.autocrlf true`

You can use the same credentials from windows inside ubuntu
 https://stackoverflow.com/a/47350274/3705470  
 ``git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"``  


# Git Command Prompt

Add this to the .bashrc or .bash_profile

```
# Git command prompt
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[$USER@$(hostname) \W$(__git_ps1)]\$ '

# This will print the current directory with the correct scapes when there are spaces in the path.
alias cwd='printf "%q\n" "$(pwd)"'

# add a way to change paths from windows to unix. This uses the tooling inside Git for windows.
# http://www.mingw.org/wiki/Posix_path_conversion
alias cygpath="/mnt/c/Program\ Files/Git/usr/bin/cygpath.exe"
```




