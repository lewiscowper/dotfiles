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

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%<
set statusline+=%f
set statusline+=%=
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ %{FugitiveHead()}
set statusline+=\ ∙
set statusline+=\ %{LinterStatus()}
set statusline+=\ ∙
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ %{ReadOnly()}
set statusline+=\ ∙
set statusline+=\ ∙
set statusline+=\ ∙

