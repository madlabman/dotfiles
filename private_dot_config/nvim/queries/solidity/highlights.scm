; identifiers
; -----------
(identifier) @variable
(yul_identifier) @variable

((identifier) @constant
 (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))

; Pragma
(pragma_directive) @tag
(solidity_version_comparison_operator _ @tag)

; Literals
; --------

[
 (string)
 (hex_string_literal)
 (unicode_string_literal)
 (yul_string_literal)
] @string
[
 (number_literal)
 (yul_decimal_number)
 (yul_hex_number)
] @number
[
 (true)
 (false)
] @constant.builtin

(comment) @comment

; Definitions and references
; -----------

(type_name) @type
(primitive_type) @type
(user_defined_type (identifier) @type)
(user_defined_type_definition (identifier) @type)

(payable_conversion_expression "payable" @type)
; Ensures that delimiters in mapping( ... => .. ) are not colored like types
(type_name "(" @punctuation.bracket "=>" @punctuation.delimiter ")" @punctuation.bracket)

; Definitions
(struct_declaration
  name: (identifier) @type)
(enum_declaration
  name: (identifier) @type)
(contract_declaration
  name: (identifier) @type)
(library_declaration
  name: (identifier) @type)
(interface_declaration
  name: (identifier) @type)
(event_definition
  name: (identifier) @type)
(error_declaration
  name: (identifier) @type)
(revert_statement
  error: (identifier) @type)

(function_definition
  name:  (identifier) @function)

(modifier_definition
  name:  (identifier) @function)
(yul_evm_builtin) @function.builtin

; Use constructor coloring for special functions
(constructor_definition "constructor" @constructor)
(receive_definition "receive" @constructor)
(fallback_definition "fallback" @constructor)

(struct_member name: (identifier) @property)
(enum_value) @constant

; Invocations
(emit_statement . (identifier) @type)
(modifier_invocation (identifier) @function)

(call_expression . (member_expression property: (identifier) @function.method))
(call_expression . (identifier) @function)

; Function parameters
(call_struct_argument name: (identifier) @field)
(event_paramater name: (identifier) @parameter)
(parameter name: (identifier) @variable.parameter)

; Yul functions
(yul_function_call function: (yul_identifier) @function)
(yul_function_definition . (yul_identifier) @function (yul_identifier) @parameter)


; Structs and members
(member_expression property: (identifier) @property)
(struct_expression type: ((identifier) @type .))
(struct_field_assignment name: (identifier) @property)


; Tokens
; -------

; Keywords
(meta_type_expression "type" @keyword)
; Keywords
[
 "pragma"
 "contract"
 "interface"
 "library"
 "type"
 "is"
 "struct"
 "enum"
 "event"
 "using"
 "assembly"
 "emit"
 "modifier"
 "var"
 "error"
 "revert"
 "abstract"
 (virtual)
 (override_specifier)
 (yul_leave)
 (unchecked)
 "let"
] @keyword

[
  "public"
  "internal"
  "private"
  "external"
  "pure"
  "view"
  "payable"
  (immutable)
] @type.qualifier

[
  "memory"
  "storage"
  "calldata"
  "constant"
] @storageclass

[
 "for"
 "while"
 "do"
] @repeat

[
 "break"
 "continue"
 "if"
 "else"
 "switch"
 "case"
 "default"
] @conditional

(ternary_expression
  "?" @conditional.ternary
  ":" @conditional.ternary)

[
 "try"
 "catch"
] @exception

[
 "return"
 "returns"
] @keyword.return

"function" @keyword.function

"import" @include
(import_directive "as" @include)
(import_directive "from" @include)

(event_paramater "indexed" @keyword)

; Punctuation

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket


[
  "."
  ","
] @punctuation.delimiter


; Operators

[
  "&&"
  "||"
  ">>"
  ">>>"
  "<<"
  "&"
  "^"
  "|"
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "<"
  "<="
  "=="
  "!="
  "!=="
  ">="
  ">"
  "!"
  "~"
  "-"
  "+"
  "++"
  "--"
] @operator

[
  "delete"
  "new"
] @keyword.operator

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^///[^/]"))
((comment) @comment.documentation
  (#lua-match? @comment.documentation "^///$"))

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))
