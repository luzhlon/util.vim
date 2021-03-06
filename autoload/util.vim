" =============================================================================
" Filename:     autoload/util.vim
" Author:       luzhlon
" Function:     Some useful scripts
" Last Change:  2017/1/29
" =============================================================================

"下一个buffertype为空的buffer，cmd=bn!|bp!
fun! util#SwitchFile(cmd)
    let nr = bufnr('%')
    exe a:cmd
    while bufnr('%') != nr && &buftype != ''
        exe a:cmd
    endw
endf
" Switch from .h and .cxx files
let s:cxx_ext = ['c', 'cpp', 'cc']
fun! util#ToggleHeader()
    let fp = expand('%:p')
    let ex = expand('%:p:e')
    let r =  expand('%:p:r')
    if index(s:cxx_ext, ex) < 0
        for e in s:cxx_ext
            let f = r . '.' . e
            if filereadable(f)
                exec 'e! ' . f
                return
            endif
        endfo
        echo 'no cxx file'
    else
        let hf = r . '.' .'h'
        if filereadable(hf)
            exec 'e! ' . hf
            return
        endif
        echo 'no header file'
    endif
endf
let s:comment = {'lua' : '--', 'python' : '#', 'vim' : '"',
            \    'c' : '//', 'cpp' : '//',   'java' : '//', 'javascript' : '//'}
" Toggle comment
fun! util#ToggleComment(...) range
    if a:0 > 1
        let i = a:1 | let j = a:2
    else
        let i = a:firstline | let j = a:lastline
    endif
try
    while i <= j
        let line = getline(i)
        let comchar = s:comment[&ft]
        if match(line, '^' . comchar) >= 0
            call setline(i, substitute(line, '^'.comchar, '', ''))
        else
            call setline(i, comchar . line)
        endif
        let i += 1
    endw
endtry
endf
" Quit buffer but not with the window close
fun! util#QuitBuffer()
    let curbuf = bufnr('%')
    let a = bufnr('#')
    if bufexists(a) && getbufvar(a, '&buftype') == ''
        b!#
    else
        bnext
    endif
    exec 'confirm '.curbuf.'bw'
endf
"Run python script
fun! util#RunPy()
    write
    if match(getline(1), '^#.*python3') < 0
        !python %:p
    else
        !python3 %:p
    endif
endf

fun! util#GetSelection()
    " Why is this not a built-in Vim script function?!
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endf
