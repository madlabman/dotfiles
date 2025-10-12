; extends

((call_expression
    function: (member_expression
        object: (member_expression
            object: (this)
            property: (property_identifier) @_obj)
        property: (property_identifier) @_fun)
    arguments: (arguments
         (template_string
             (string_fragment) @injection.content)))

    (#eq? @_obj "db")
    (#any-of? @_fun "exec" "pragma" "prepare")

(#set! injection.language "sql"))

((call_expression
    function: (member_expression
        object: (member_expression
            object: (this)
            property: (property_identifier) @_obj)
        property: (property_identifier) @_fun)
    arguments: (arguments
         (string ; TODO: Is it possible to combine with template_string?
             (string_fragment) @injection.content)))

    (#eq? @_obj "db")
    (#any-of? @_fun "exec" "pragma" "prepare")

(#set! injection.language "sql"))

; evm
((variable_declarator
    name: (identifier) @_var
    value:
         (template_string ; TODO: Is it possible to combine with template_string?
             (string_fragment) @injection.content))

    (#eq? @_var "sql")

(#set! injection.language "sql"))
