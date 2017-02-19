if has('win32')
"    au GUIEnter * call SetAlpha(230)
    com! Maximize call EnableMaximize(1)
else
    finish
endif

func! SetAlpha(n)
    call libcallnr('vimtweak64.dll', 'SetAlpha', a:n)
endf
func! EnableCaption(b)
    call libcallnr('vimtweak64.dll', 'EnableCaption', a:b)
endf
func! EnableTopMost(b)
    call libcallnr('vimtweak64.dll', 'EnableTopMost', a:b)
endf
func! EnableMaximize(b)
    call libcallnr('vimtweak64.dll', 'EnableMaximize', a:b)
endf
