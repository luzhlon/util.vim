" =============================================================================
" Filename:     plugin/util.vim
" Author:       luzhlon
" Function:     Some useful scripts
" Last Change:  2017/1/29
" =============================================================================

com! NextFile      call util#SwitchFile('bn!')
com! PrevFile      call util#SwitchFile('bp!')
com! ToggleHeader  call util#ToggleHeader()
com! QuitBuffer    call util#QuitBuffer()
com! -range ToggleComment call util#ToggleComment(<line1>, <line2>)

nnoremap <Plug>(SoLine) "tyy:execute @t<cr>
vnoremap <Plug>(SoLines) "ty:execute @t<cr>
