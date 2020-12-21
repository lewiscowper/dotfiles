" Automatically change the statusline color depending on mode
let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '^S' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008 guifg=None gui=None cterm=None'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005 guifg=#AE90AB gui=None cterm=None'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=#93BECE gui=None cterm=None'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=#A8BD91 gui=None cterm=None'
  endif

  return ''
endfunction

function! ReadOnly() abort
	if &readonly || !&modifiable
		return '!!'
	else
		return ''
	endif
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return '∙ ' . join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set statusline=
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%<
set statusline+=\ %n
set statusline+=\ —
set statusline+=\ %{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}
set statusline+=\ ∙
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ ∙
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%=
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ %{ReadOnly()}
set statusline+=\ %Y
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=" "

