; extends

; scm_query = 
((assignment
    left: (identifier) @_var
    right: (string
              (string_content) @injection.content))

    (#match? @_var "scm_query.*")

(#set! injection.language "query"))
