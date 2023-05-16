(function_definition
  name: (identifier) @name
  (#set! "kind" "Function")
  ) @type

(interface_declaration
  name: (identifier) @name
  (#set! "kind" "Interface")
  ) @type

(contract_declaration
  name: (identifier) @name
  (#set! "kind" "Class")
  ) @type

(enum_declaration
  name: (identifier) @name
  (#set! "kind" "Enum")
  ) @type

(struct_declaration
  name: (identifier) @name
  (#set! "kind" "Struct")
  ) @type

(constructor_definition
  ("constructor") @name
  (#set! "kind" "Constructor")
  ) @type
