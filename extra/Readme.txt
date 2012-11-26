vimtweak.zip: 
description
This should work on Win2k (or WinXP maybe, and win7) 

Alpha Window: 
  200/255 alpha 
  :call libcallnr("vimtweak.dll", "SetAlpha", 200) 
  reset alpha 
  :call libcallnr("vimtweak.dll", "SetAlpha", 255) 

Maximized Window: 
  Enable 
  :call libcallnr("vimtweak.dll", "EnableMaximize", 1) 
  Disable 
  :call libcallnr("vimtweak.dll", "EnableMaximize", 0) 

TopMost Window: 
  Enable 
  :call libcallnr("vimtweak.dll", "EnableTopMost", 1) 
  Disable 
  :call libcallnr("vimtweak.dll", "EnableTopMost", 0) 
 
install details
copy vimtweak.dll to same directory with gvim.exe

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++