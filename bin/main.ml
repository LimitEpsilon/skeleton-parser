open Project
open Pp

let main () =
  let src = ref "" in
  let flag = ref true in
  let _ =
    Arg.parse
      [
        ( "-pp",
          Arg.Unit
            (fun () -> flag := true), "pretty print");]
      (fun x -> src := x)
      ("Usage: " ^ Filename.basename Sys.argv.(0) ^ " [-pp] [file]")
  in
  let lexbuf =
    Lexing.from_channel (if !src = "" then stdin else open_in !src)
  in
  let pgm = Parser.program Lexer.start lexbuf in
  pp pgm; print_newline()

let _ = main ()
