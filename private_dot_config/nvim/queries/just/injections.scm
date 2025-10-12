; extends

; luajit -> lua
(recipe
  (recipe_body
    (shebang
      (language) @_lang)) @injection.content
  (#eq? @_lang "luajit")
  (#set! injection.language "lua")
  (#set! injection.include-children))

; bun -> js
(recipe
  (recipe_body
    (shebang
      (language) @_lang)) @injection.content
  (#eq? @_lang "bun")
  (#set! injection.language "javascript")
  (#set! injection.include-children))

; gorun -> go
(recipe
  (recipe_body
    (shebang
      (language) @_lang)) @injection.content
  (#eq? @_lang "gorun")
  (#set! injection.language "go")
  (#set! injection.include-children))

; zsh -> bash
(recipe
  (recipe_body
    (shebang
      (language) @_lang)) @injection.content
  (#eq? @_lang "zsh")
  (#set! injection.language "bash")
  (#set! injection.include-children))
