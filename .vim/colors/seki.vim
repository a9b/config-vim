" Vim color file
" Maintainer: seki	
" Last Change:	Apr 4, 2012
" Licence:	    Public Domain

" This package offers a eye-catching color scheme for PHP syntax

" First remove all existing highlighting.
"set background=none
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "seki"

hi Normal guifg=#ff0000 guibg=#ff0000

hi ErrorMsg guibg=#ff0000 guifg=Red
hi IncSearch gui=reverse
hi ModeMsg gui=bold
hi StatusLine gui=reverse,bold
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
hi Visual gui=reverse guifg=#ff0000 guibg=fg
hi VisualNOS gui=underline,bold
hi DiffText gui=bold guibg=Red
hi Cursor guibg=#ff0000 guifg=NONE
hi lCursor guibg=#ff0000 guifg=NONE
hi Directory guifg=#ff0000
hi LineNr guifg=#ff0000
hi MoreMsg gui=bold guifg=SeaGreen
hi NonText gui=bold guifg=#ff0000 guibg=#ff0000
hi Question gui=bold guifg=#ff0000
hi Search guibg=#ff0000
hi SpecialKey guifg=#ff0000
hi Title gui=bold guifg=Magenta
hi WarningMsg guifg=Red
hi WildMenu guibg=Cyan guifg=#ff0000
hi Folded guibg=White guifg=Darkblue
hi FoldColumn guibg=#ff0000 guifg=Darkblue
hi DiffAdd guibg=Lightblue
hi DiffChange guibg=LightMagenta
hi DiffDelete gui=bold guifg=#ff0000 guibg=LightCyan

hi Comment guifg=#ff0000 guibg=none
hi Constant guifg=#ff0000 guibg=#ff0000
hi PreProc guifg=#ff0000 guibg=#ff0000
hi Statement gui=NONE guifg=#ff0000 guibg=#ff0000
hi Special guifg=#ff0000 guibg=#ff0000
hi Ignore guifg=#ff0000
hi Identifier guifg=#ff0000 guibg=#ff0000
hi Type guifg=#ff0000 guibg=#ff0000

hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

" vim: sw=2
