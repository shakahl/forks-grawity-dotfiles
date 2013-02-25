runtime! syntax/conf.vim

setl commentstring=#\ %s

syn region	confCComment	start=+^\s*/\*+ end=+\*/+
syn region	confCComment	start=+\s/\*+ end=+\*/+
syn region	confCComment	start=+^\s*//+ end=+$+
syn region	confCComment	start=+\s//+ end=+$+
hi def link	confCComment	Comment
syn sync	ccomment	confCComment
syn sync	minlines=100

syn match	confSection	/[{}(),;]/
hi def link	confSection	Delimiter

syn match	confOperator	/=/
hi def link	confOperator	Operator
