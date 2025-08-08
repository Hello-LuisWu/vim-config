let g:lightline = {
\	 'colorscheme': 'wombat',
\	 'active': {
\		'left': [
\			[ 'mode'],
\			['paste' ],
\			[ 'readonly', 'filename',],
\			[ 'modified']
\		],
\		'right': [
\		   ['Love'],
\		   ['fileformat'],
\		   ['fileencoding'],
\		   ['filetype'],
\		]
\	 },
\	 'component_function': {
\		'Love': 'gitbranch#name'
\	 },
\ }
