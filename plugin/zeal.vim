if exists("g:loaded_zeal") || v:version < 704 || &compatible
  finish
endif
let g:loaded_zeal = 1

let s:save_cpo = &cpo
set cpo&vim

if !executable('zeal')
  " echoerr 'zeal is not installed'
  finish
endif

augroup F1Zeal
  autocmd!
  autocmd Filetype c           call s:mapf1('C language')
  autocmd Filetype cmake       call s:mapf1('cmake-buildsystem')
  autocmd Filetype css         call s:mapf1('Cascading Style Sheets')
  autocmd Filetype haskell     call s:mapf1('Prelude')
  autocmd Filetype http        call s:mapf1('An overview of HTTP')
  autocmd Filetype java        call s:mapf1('java.lang')
  autocmd Filetype lua         call s:mapf1('print')
  autocmd Filetype make        call s:mapf1('Top')
  autocmd Filetype ruby        call s:mapf1('Philosophy')
  autocmd Filetype pandoc      call s:mapf1('User''s Guide')
  autocmd Filetype perl        call s:mapf1('print')
  autocmd Filetype python      call s:mapf1('An informal introduction to Python')
  autocmd Filetype r           call s:mapf1('Introduction')
  autocmd Filetype ruby        call s:mapf1('io.print')

  autocmd Filetype ?html       call s:mapf1('body', 'html')
  autocmd Filetype ps1         call s:mapf1('Out-Host', 'posh')
  autocmd Filetype sh,bash,zsh call s:mapf1('Basic Shell Features', 'bash')
  autocmd Filetype tex         call s:mapf1('Overview of LaTeX', 'latex')
augroup END

if exists(':Silent') != 2
  if has('unix')
    if has('win32unix') " Git Bash provides /usr/bin/start script calling cmd.exe //c
      " use start //b "" to set void title and avoid ambiguity with passed argument
      command! -complete=shellcmd -nargs=1 -bang Silent
            \ exe 'silent !' . (<bang>0 ? 'start "" //b' : '') . ' ' . <q-args> | execute ':redraw!'
    elseif exists('$WSL_DISTRO_NAME') " use cmd.exe to start GUI apps in WSL
      command! -complete=shellcmd -nargs=1 -bang Silent execute ':silent !' .
            \ <bang>0 ? ((<q-args> =~? '\v<\f+\.(exe|com|bat|cmd)>') ?
              \ 'cmd.exe /c start "" /b ' . <q-args> :
              \ 'nohup ' . <q-args> . ' </dev/null >/dev/null 2>&1 &') :
            \ <q-args> | execute ':redraw!'
    else
      command! -complete=shellcmd -nargs=1 -bang Silent execute ':silent !' .
            \ (<bang>0 ? 'nohup ' . <q-args> . ' </dev/null >/dev/null 2>&1 &' : <q-args>) | execute ':redraw!'
    endif
  elseif has('win32')
    command! -complete=shellcmd -nargs=1 -bang Silent
          \ exe 'silent !' .
          \ (&shell =~? '\<cmd\.exe\>' ? '' : 'cmd.exe /c ') .
          \ 'start ' . (<bang>0 ? '/b' : '') . ' ' . <q-args> | execute ':redraw!'
  endif
endif

function s:mapf1(entry, ...)
  let lang = a:0 > 0 ? a:1 : &filetype
  let f1 = maparg('<F1>', 'n', 0, 1)
  if empty(f1) || !f1.buffer
    exe "nnoremap <buffer> <expr> <F1> ':<c-u>Silent! zeal \"" . lang . ":' . (empty(expand('<cword>')) ? '" . substitute(a:entry, "'", "''", 'g') . "' : expand('<cword>')) . '\"<cr>'"
    if exists('b:undo_ftplugin')
      let b:undo_ftplugin .= '|silent! unmap <buffer> <F1>'
    else
      let b:undo_ftplugin  =  'silent! unmap <buffer> <F1>'
    endif
  endif
endfunction

let &cpo = s:save_cpo
