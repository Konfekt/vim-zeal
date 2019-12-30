if &compatible || exists('g:loaded_zeal')
    finish
endif

if has('unix')
  command! -complete=shellcmd -nargs=1 -bang Silent execute ':silent<bang> !' . 'nohup ' . <q-args> . '</dev/null >/dev/null 2>&1 &' | execute ':redraw!'
elseif has('win32')
  command! -complete=shellcmd -nargs=1 -bang Silent execute ':silent<bang> !start /b ' . <q-args> | execute ':redraw!'
endif

let g:loaded_zeal = 1
