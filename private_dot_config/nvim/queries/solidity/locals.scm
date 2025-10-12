; Definitions
(struct_declaration
  name: (identifier) @local.definition)
(enum_declaration
  name: (identifier) @local.definition)
(contract_declaration
  name: (identifier) @local.definition)
(library_declaration
  name: (identifier) @local.definition)
(interface_declaration
  name: (identifier) @local.definition)
(event_definition
  name: (identifier) @local.definition)
(error_declaration
  name: (identifier) @local.definition)
(revert_statement
  error: (identifier) @local.definition)
(function_definition
  name: (identifier) @local.definition)
(modifier_definition
  name: (identifier) @local.definition)
(parameter
  name: (identifier) @local.definition)
(state_variable_declaration
  name: (identifier) @local.definition)
(variable_declaration
  name: (identifier) @local.definition)
(yul_variable_declaration
  left: (yul_identifier) @local.definition)


; References
(identifier) @local.reference
(yul_identifier) @local.reference

; Scope
[
  (source_file)
  (for_statement)
  (if_statement)
  (while_statement)
  (assembly_statement)
  (contract_declaration)
  (library_declaration)
  (function_definition)
  (block_statement) ; a block in curly braces
  (yul_block)
  (yul_for_statement)
  (yul_if_statement)
] @local.scope
