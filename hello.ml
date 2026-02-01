(* ===================================================== *)
(* hello.ml — First OCaml example for CMSC 330            *)
(* ===================================================== *)

(*
   OCaml has no main() function.

   Instead, an OCaml program consists of *top-level expressions*.
   These expressions are evaluated from top to bottom when the
   program starts.

   Any OCaml expression may appear at the top level:
     - value bindings        (let x = ...)
     - function definitions
     - function calls
     - printing, mutation, etc.

   If a top-level expression has side effects,
   those side effects occur immediately.

   In this sense, the OCaml top level plays the role
   of C++ main().
*)

(* ----------------------------------------------------- *)
(* Example 1: Top-level side effect                       *)
(* ----------------------------------------------------- *)

(*
   print_endline : string -> unit

   OCaml is strongly typed: EVERY expression has a type.
   The type 'unit' is similar to Java's void:
     - the computation is performed for its side effects
     - no meaningful value is produced

   Convention:
   We often write "let () = e" to make it explicit that
   e is executed only for its side effects and must
   have type unit.
*)

let () =
  print_endline "Hello, OCaml!"


(* ----------------------------------------------------- *)
(* Example 2: Defining a function vs calling it           *)
(* ----------------------------------------------------- *)

(*
   This defines a function.
   Defining a function is pure: no side effects occur here.
*)
let greet () =
  Printf.printf "Hello\n"
  (* Printf.printf : string -> unit *)

(*
   This is a top-level function call.
   The side effect happens here.
*)
let () =
  greet ()


(* ----------------------------------------------------- *)
(* Example 3: Pure computation (no side effects)          *)
(* ----------------------------------------------------- *)

(*
   List.fold_left computes a value.
   There are no side effects here.
*)
let sum =
  List.fold_left ( + ) 0 [1;2;3;4;5;6;7;8;9;10]
  (* sum : int *)

(*
   Printing introduces a side effect,
   so we again use let () = at the top level.
*)
let () =
  Printf.printf "Sum = %d\n" sum


(* ----------------------------------------------------- *)
(* Example 4: Immutable bindings and shadowing            *)
(* ----------------------------------------------------- *)

(*
   Bindings are immutable by default.
   Reusing a name creates a new binding (shadowing),
   not a mutation.
*)

let x = 4
let y = x + 1
let x = 5    (* new binding; the old x is unchanged *)

(* All of the above are pure value bindings *)


(* ----------------------------------------------------- *)
(* Example 5: Mutable state with references               *)
(* ----------------------------------------------------- *)

(*
   A reference is a mutable cell.
   y : int ref
*)
let y = ref 10

(*
   := mutates the reference and returns unit.
   ! dereferences the reference.

   Unlike Java, assignment in OCaml is an expression
   with a type (unit), not a statement.
*)
let () =
  y := 20;
  Printf.printf "y = %d\n" !y
