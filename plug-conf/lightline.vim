let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
	  \   'left': [
	  \		[ 'mode'], ['paste' ],[ 'readonly', 'filename',],[ 'modified']
      \],
	  \		'right': [
	  \[		'helloworld'],
	  \[		'fileformat'],
	  \[		'fileencoding'],
	  \[		'filetype'],
      \]
      \ },
      \ 'component': {
      \   'helloworld': 'Love DJL'
      \ },
      \ }

