# Skeleton Parser

A parser skeleton for a toy language `L` that is defined as:
```shell
<e> ::= <id>                  ;; identifer (C-style)
      | \ <id> . <e>          ;; abstraction
      | <e> <e>               ;; application
      | let <id> = <e> in <e> ;; let expression
```

