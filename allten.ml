type solution = {value:int; repr:string};;

let combine_solutions (a: solution) (b: solution) =
  [
    {value = a.value + b.value; repr = "+" ^ a.repr ^ b.repr};
    {value = a.value - b.value; repr = "-" ^ a.repr ^ b.repr};
    {value = b.value - a.value; repr = "-" ^ b.repr ^ a.repr};
(* For now, restrict to addition and subtraction until we can deal with rationals
    {value = a.value * b.value; repr = "*" ^ a.repr ^ b.repr};
    {value = a.value / b.value; repr = "/" ^ a.repr ^ b.repr};
    {value = b.value / a.value; repr = "/" ^ b.repr ^ a.repr};
*)
  ]
;;

(* let combine_solution_lists (a: solution list) (b: solution list) =
  List.fold_left (fun acc x ->
    List.fold_left (fun acc y -> combine_solutions x y :: acc) acc b
    ) [] a
 *)
(* let rec solutions digits =
  match digits with
  | [] -> []
  | v :: tail -> combine_solutions [{value=v, repr = string_of_int v}] (solutions tail)
;;
 *)

let f elem =
  Printf.printf "%s = %d\n" elem.repr elem.value
in
  List.iter f (combine_solutions {value=2; repr="2"} {value=3; repr="3"})
;;
Printf.printf "\n"

let rec map_pairs f l =
  match l with
  | [] -> []
  | l :: tail ->
    List.concat [List.concat_map (fun t -> f t l) tail; map_pairs f tail]
;;

let pair_solutions_123 = map_pairs combine_solutions [{value=1; repr="1"}; {value=2; repr="2"}; {value=3; repr="3"}];;

let f elem =
  Printf.printf "%s = %d\n" elem.repr elem.value
in
  List.iter f pair_solutions_123
;;
Printf.printf "\n"

let rec map_combinations f l n =
  match l with
  | [] -> []
  | l :: tail -> if n > 2 then
    List.concat [List.concat_map (fun t -> f t l) (map_combinations f tail (n-1)); map_pairs f (map_combinations f tail (n-1))]
  else
    List.concat [List.concat_map (fun t -> f t l) tail; map_pairs f tail]
;;

let triplet_solutions_123 = map_combinations combine_solutions [{value=1; repr="1"}; {value=2; repr="2"}; {value=3; repr="3"}] 3;;

let f elem =
  Printf.printf "%s = %d\n" elem.repr elem.value
in
  List.iter f triplet_solutions_123
;;
Printf.printf "\n"
