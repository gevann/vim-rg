function! RgCommand(split_cmd, ...)
  let buffer_opts = " | setlocal buftype=nofile | set filetype=ripgrep | setlocal cc="
  let cmd = " | 0r! rg " . join(a:000) . " --vimgrep"
  let keyword = " | hi Normal ctermfg=gray | syn match Search /" . a:1 . "/"
  exec a:split_cmd . buffer_opts . keyword . cmd
endfunction

command! -range RG :execute "Srg '" . @* . "'"
command! -nargs=* Srg :call RgCommand(":new", <f-args>)
command! -nargs=* Vrg :call RgCommand(":vnew", <f-args>)
command! -nargs=* Erg :call RgCommand(":enew",  <f-args>)

nnoremap <leader>rg :execute "Srg " . expand("<cword>")<cr>
vnoremap <leader>rg y:execute "Srg " . "'<C-r>0'"<cr>
nnoremap <leader>vrg :execute "Vrg " . expand("<cword>")<cr>
vnoremap <leader>vrg y:execute "Vrg " . "'<C-r>0'"<cr>
