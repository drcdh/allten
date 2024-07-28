# allten
All Ten solution space analysis

# About
This is an excercise in (re)learning OCaml after last using the language over ten years ago!
The project looks at the "All Ten" game (hosted by [Beast Academy](https://beastacademy.com/all-ten), for example), which goes by other names as well.
The goal isn't just to create a solver - that's boring and for cheaters! - but rather to explore the solution spaces of combinations of numbers. Obviously, some combinations of four numbers, like all ones, can't create all ten desired results. What's more interesting is finding the combinations that are "hard" but possible to make all ten with. Are there patterns that make combinations difficult or easy?

This will likely involve dynamic programming. Consider the number of possibilities. Choosing three out of the four basic arithmetic operations has 12 possibilities. So brute forcing the solutions for a given set of four numbers is easy. However, choosing four ordered numbers out of 1 through 10 has nearly 10000 possibilities (duplicate numbers are interchangable)!

# Notes
    bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
    opam init
    opam install ocaml-lsp-server odoc ocamlformat utop
https://ocaml.org/docs/your-first-program#minimum-setup

    eval $(opam env)

    dune build
    dune exec ./allten.exe