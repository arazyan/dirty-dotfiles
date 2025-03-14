if exists("b:current_syntax")
    finish
endif

" Define keywords and operators
syntax keyword pdlKeyword def protocol msg goto deduce break continue decide sync
syntax match pdlOperator /[{};,|\[\]<>.||*@]/ 
syntax match pdlLabel /\$\w\+/
syntax match pdlArrow />>\|<</

" Define comment handling (everything after //)
syntax match pdlComment "//.*$"

" Define message declaration (msg)
syntax match pdlMessage /msg\s\+\w\+/

" Define function and protocol definitions
syntax match pdlDefinition /\bdef\s\+\w\+/

" Define template arguments (e.g. <arg>)
syntax match pdlTemplateArg /<.*?>/

" Define role names (e.g. User, Server, CloudStorage)
syntax match pdlRoleName /\b\w\+\b/

" Highlighting for end names (e.g. .end-name)
syntax match pdlEndName /\.\w\+/

" Define numeric labels
syntax match pdlNumericLabel /\d\+/

" Highlighting links (map syntax names to highlight groups)
highlight link pdlKeyword Keyword
highlight link pdlOperator Operator
highlight link pdlLabel Label
highlight link pdlArrow Statement
highlight link pdlError Error
highlight link pdlComment Comment
highlight link pdlMessage Identifier
highlight link pdlDefinition Function
highlight link pdlTemplateArg Type
highlight link pdlRoleName Type
highlight link pdlEndName Constant
highlight link pdlNumericLabel Number

let b:current_syntax = "pdl"

