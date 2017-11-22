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

# Git Command Prompt

Add this to the .bashrc or .bash_profile

```
# This should add the git. Change the mbp to you the name of the urrent laptop.
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \W$(__git_ps1)]\$ '

# This will print the current directory witht he correct scapes.
alias cwd='printf "%q\n" "$(pwd)"'
```




