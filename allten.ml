type solution = {value:int; repr:string};;

let division_solution (a: solution) (b: solution) =
  if a.value mod b.value == 0 then
    [{value = a.value / b.value; repr = "/" ^ a.repr ^ b.repr};]
  else if b.value mod a.value == 0 then
    [{value = b.value / a.value; repr = "/" ^ b.repr ^ a.repr};]
  else
    []
;;

let combine_solutions (a: solution) (b: solution) =
  List.concat [
    [
      {value = a.value + b.value; repr = "+" ^ a.repr ^ b.repr};
      {value = a.value - b.value; repr = "-" ^ a.repr ^ b.repr};
      {value = b.value - a.value; repr = "-" ^ b.repr ^ a.repr};
      {value = a.value * b.value; repr = "*" ^ a.repr ^ b.repr};
    ];
    (division_solution a b);
  ]
;;

let print_solutions s =
  let f elem =
    Printf.printf "%s = %d\n" elem.repr elem.value
  in
    List.iter f s
  ;
  Printf.printf "\n"
;;

Printf.printf "combine_colutions 2 4\n";;
print_solutions (combine_solutions {value=2; repr="2"} {value=4; repr="4"})

let rec map_pairs f l =
  match l with
  | [] -> []
  | l :: tail ->
    List.concat [List.concat_map (fun t -> f t l) tail; map_pairs f tail]
;;

let pair_solutions_123 = map_pairs combine_solutions [{value=1; repr="1"}; {value=2; repr="2"}; {value=3; repr="3"}];;

Printf.printf "map_pairs combine_solutions [1; 2; 3]\n";;
print_solutions pair_solutions_123

let rec map_combinations f l n =
  match l with
  | [] -> []
  | l :: tail -> if n > 2 then
    List.concat [List.concat_map (fun t -> f t l) (map_combinations f tail (n-1))]
  else
    List.concat [List.concat_map (fun t -> f t l) tail; map_pairs f tail]
;;

let elem_123 = [{value=1; repr="1"}; {value=2; repr="2"}; {value=3; repr="3"}];;
let elem_1234 = [{value=1; repr="1"}; {value=2; repr="2"}; {value=3; repr="3"}; {value=4; repr="4"}];;

let triplet_solutions_123 = map_combinations combine_solutions elem_123 3;;
Printf.printf "map_combinations combine_solutions [1; 2; 3] 3\n";;
print_solutions triplet_solutions_123

let quartet_solutions_1234 = map_combinations combine_solutions elem_1234 4;;
Printf.printf "map_combinations combine_solutions [1; 2; 3; 4] 4\n";;
print_solutions quartet_solutions_1234
