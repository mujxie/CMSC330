(* ===================================================== *)
(* hello.ml — First OCaml example for CMSC 330            *)
(* ===================================================== *)

(*
   In OCaml, there is no main() function.
   The program consists of top-level bindings and expressions,
   which are evaluated from top to bottom.
*)

(* ----------------------------------------------------- *)
(* Example 1: Top-level side effect using let () =        *)
(* ----------------------------------------------------- *)

(*
   print_endline : string -> unit

   The type 'unit' plays a role similar to 'void' in Java:
     - the computation is performed for its side effects
     - no meaningful value is returned

   Important:
   Writing side-effecting code at the top level does NOT require
   using "let () =". The following would also work:

       print_endline "Hello, OCaml!"

   We recommend "let () = e" because it explicitly states that
   the expression e is intended to have type unit, and the compiler
   will reject the code if it accidentally produces a value.
*)

let () =
  print_endline "Hello, OCaml!"


(* ----------------------------------------------------- *)
(* Example 2: Defining a function vs calling it           *)
(* ----------------------------------------------------- *)

(*
   This defines a function.
   Defining a function has NO side effects by itself.
   Nothing is printed yet.
*)
let greet () =
  Printf.printf "Hello\n"
  (* Printf.printf also returns unit *)

(*
   This is a top-level call of the function.
   The side effect happens here.
   Again, using "let () =" is a convention, not a requirement.
*)
let () =
  greet ()


(* ----------------------------------------------------- *)
(* Example 3: Pure computation (no side effects)          *)
(* ----------------------------------------------------- *)

(*
   List.fold_left computes a value.
   There are NO side effects here.
   The result is an integer, not unit.
*)
let sum =
  List.fold_left ( + ) 0 [1;2;3;4;5;6;7;8;9;10]

(*
   Printing the result is a side effect,
   so we use let () = to emphasize that intent.
*)
let () =
  Printf.printf "Sum = %d\n" sum


(* ----------------------------------------------------- *)
(* Example 4: Shadowing vs mutation                       *)
(* ----------------------------------------------------- *)

(*
   OCaml bindings are immutable by default.
   Reusing a name creates a new binding (shadowing),
   not an update.
*)

let x = 4
let y = x + 1
let x = 5    (* this is a NEW x; the old x is unchanged *)

(* No side effects above — only value bindings *)


(* ----------------------------------------------------- *)
(* Example 5: Mutable state with references               *)
(* ----------------------------------------------------- *)

(*
   A reference is a mutable cell.
   y : int ref
*)
let y = ref 10

(*
   The assignment operator (:=) produces unit.
   Dereferencing uses the ! operator.

   As before, the code would still work without "let () =",
   but we use it to make the side effects explicit and to
   ensure the expression has type unit.
*)
let () =
  y := 20;                              (* mutation, returns unit *)
  Printf.printf "y = %d\n" !y           (* dereference and print *)
