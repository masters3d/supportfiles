# supportfiles
Support files I need to run my peripherals under windows


## Closing windows on the left side:
- Turns out you are able to close windows by double clicking on the left side of a window. You can also open a quick menu by hitting `alt + space` then you can use the x, n to close or minimize. More infor [here](https://ux.stackexchange.com/questions/55260/whats-the-point-of-closing-windows-by-double-clicking-their-top-left?newreg=257696e490004174894f6e176940194e)

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

# Shortcuts
- You can set the snipping tool to act just like the screenshot tool in mac
https://www.quora.com/How-do-I-launch-Snipping-tool-in-Windows-and-the-actual-new-snip-command-simultaneously

- I have also tried which does an excelent job at mapping thing like Command + H to hide windows. ETC. 
- https://inchwest.com/hotkeycontrol/#mapkeyboard

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

#Add default start up dir. This will make sure that you start in a windows dir location.
# Add your user name or the place where you keep all your local repos.
cd /mnt/c/Users/
```




