(primitive_type) @type
(user_defined_type_definition (identifier) @type)

; Definitions
(struct_declaration
  name: (identifier) @struct)
(enum_declaration
  name: (identifier) @enum)
(contract_declaration
  name: (identifier) @class)
(library_declaration
  name: (identifier) @class)
(interface_declaration
  name: (identifier) @interface)
(event_definition
  name: (identifier) @event)
(error_declaration
  name: (identifier) @error)
(function_definition
  name:  (identifier) @method)
(modifier_definition
  name:  (identifier) @function)

(struct_member name: (identifier) @field)
(enum_value) @enummember

(state_variable_declaration
  name: (identifier) @variable)
(variable_declaration
  name: (identifier) @variable)
(parameter name: (identifier) @variable)

[
 "delete"
 "new"
 "return"
 "returns"
 "try"
 "catch"
 "break"
 "continue"
 "if"
 "else"
 "switch"
 "case"
 "default"
 "for"
 "while"
 "do"
 "memory"
 "storage"
 "calldata"
 "constant"
 "public"
 "internal"
 "private"
 "external"
 "pure"
 "view"
 "payable"
 (immutable)
 "pragma"
 "contract"
 "interface"
 "library"
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
] @keyword
