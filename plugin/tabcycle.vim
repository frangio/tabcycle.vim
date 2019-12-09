cnoremap <expr> <script> <Tab>    <SID>c_Tab(0)
cnoremap <expr> <script> <S-Tab>  <SID>c_Tab(1)

function! s:c_Tab(shift)
  let l:cmdtype = getcmdtype()
  if l:cmdtype ==# '/' || l:cmdtype ==# '?'
    let l:forward = xor(a:shift, l:cmdtype ==# '/')
    return l:forward ? "\<C-G>" : "\<C-T>"
  else
    let l:key = a:shift ? "\<S-Tab>" : "\<Tab>"
    call feedkeys(l:key, 'nti')
    return ''
  endif
endfunction
