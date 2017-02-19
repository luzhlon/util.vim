" =============================================================================
" Filename:     plugin/command.vim
" Author:       luzhlon
" Function:     Some useful commands
" Last Change:  2017/2/16
" =============================================================================

"change current directory
com! Locate if &buftype == ''|lc %:p:h |endif
"open a scratch buffer
com! Scratch ene|setl buftype=nofile|setl noswapfile|setl bufhidden=hide
"有道词典网页
com! YouDao  call netrw#BrowseX('http://dict.youdao.com/w/eng/'.expand('<cword>'), netrw#CheckIfRemote())
"enlarge/reduce font size
com! FontEnlarge call <SID>addFontSize(1)
com! FontReduce  call <SID>addFontSize(-1)

com! CountChar echo wordcount()

fun! s:addFontSize(n)
    let &gfn =
        \substitute(&gfn, '\d\+', '\=submatch(0)+' . a:n, '')
    let &gfw =
        \substitute(&gfw, '\d\+', '\=submatch(0)+' . a:n, '')
endf
