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

# Mapping CapsLock to something more useful
- http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows
- Mapping LAlt, LWin to RCtrl, LCtrl is the best thing that I could come up with so  
 I dont have to think about when it switch from a Mac keyboard to a Windows layout.  
 The problem with this approach is that I do not have an ALT on the left side.  
 Using AutoHotkey we should be able to map Capslock to act as Escape when used alone or alt when used with other modifiers. 
 
# How to enable the F key (fkeys) in a the magic keyboard without bootcamp.
![](keyboard-support-fn.jpg)
Flip this bit to zero so you do not have to use the fn keys. 
You can also find out how to edit your settings for the track pad here: https://superuser.com/questions/172658/anyone-know-how-to-modify-settings-for-the-apple-magic-trackpad-on-windows-with

# Git Settings
This fixes the line ending so you can use the git from inside bash ubuntu in windows.
`git config --global core.autocrlf true`

You can use the same credentials from windows inside ubuntu
 https://stackoverflow.com/a/47350274/3705470  
 ``git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"``  
 
 Add name and email
 
 `git config --global user.name "Cheyo Jimenez"`   
 `git config --global user.email johndoe@example.com`  
https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

Edit the global settings:  
`git config --edit --global`

Edit the default git editor.
`git config --global core.editor "code --wait"`

# Shortcuts
- You can set the snipping tool to act just like the screenshot tool in mac
https://www.quora.com/How-do-I-launch-Snipping-tool-in-Windows-and-the-actual-new-snip-command-simultaneously

- I have also tried which does an excelent job at mapping thing like Command + H to hide windows. ETC. 
- https://inchwest.com/hotkeycontrol/#mapkeyboard

# Git Command Prompt

VS Code has its own command promt that can be more userfriendly that the build in windows ones. 
You should map the windows git bash command prompt to be used inside the vs code command prompt. 
This allows copy and paste among other nice things. 


Add this to the .bashrc or .bash_profile

```
# Default editor
export EDITOR='code --wait'
export VISUAL='code --wait'

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

# emulate open from mac
alias open=explorer.exe
```

# WSL  
``wslpath to do WSL<->Windows path conversions.``
https://docs.microsoft.com/en-us/windows/wsl/release-notes#build-17063

`wslconfig.exe /list` This will show all the current installed distributions.  
