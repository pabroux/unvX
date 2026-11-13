let s:bar = ['#112638', 'NONE']
let s:text = ['#c3ccdc', 'NONE']
let s:nc_bar = ['#2c3043', 'NONE']
let s:nc_text = ['#7d8593', 'NONE']

function! s:mode(accent) abort
  return {
    \ 'left': [[s:bar, a:accent, 'bold'], [s:text, s:bar]],
    \ 'middle': [[s:text, s:bar]],
    \ 'right': [[s:bar, a:accent, 'bold'], [s:text, s:bar]],
    \ }
endfunction

let s:p = {
  \ 'normal': s:mode(['#4bc3cc', 'NONE']),
  \ 'insert': s:mode(['#07ffd6', 'NONE']),
  \ 'visual': s:mode(['#cc7fff', 'NONE']),
  \ 'replace': s:mode(['#fe605a', 'NONE']),
  \ 'command': s:mode(['#ffd542', 'NONE']),
  \ 'terminal': s:mode(['#fa902d', 'NONE']),
  \ 'inactive': {
  \   'left': [[s:nc_text, s:nc_bar, 'bold'], [s:nc_text, s:nc_bar]],
  \   'middle': [[s:nc_text, s:nc_bar]],
  \   'right': [[s:nc_text, s:nc_bar], [s:nc_text, s:nc_bar]],
  \ },
  \ 'tabline': {
  \   'left': [[s:text, s:bar]],
  \   'tabsel': [[s:bar, ['#4bc3cc', 'NONE'], 'bold']],
  \   'middle': [[s:text, s:bar]],
  \   'right': [[s:text, s:bar]],
  \ },
  \ }

let g:lightline#colorscheme#unvx#palette = lightline#colorscheme#flatten(s:p)
