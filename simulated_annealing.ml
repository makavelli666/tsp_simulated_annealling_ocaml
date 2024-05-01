


(* 30 villes
     let villes = [
  {nom = "Paris"; x = 48.8566; y = 2.3522};
  {nom = "Lyon"; x = 45.7578; y = 4.8320};
  {nom = "Marseille"; x = 43.2965; y = 5.3698};
  {nom = "Bordeaux"; x = 44.8378; y = -0.5792};
  {nom = "Lille"; x = 50.6333; y = 3.0667};
  {nom = "Nantes"; x = 47.2184; y = -1.5536};
  {nom = "Toulouse"; x = 43.6047; y = 1.4442};
  {nom = "Nice"; x = 43.7032; y = 7.2663};
  {nom = "Strasbourg"; x = 48.5734; y = 7.7521};
  {nom = "Rennes"; x = 48.1142; y = -1.6778};
  {nom = "Montpellier"; x = 43.6108; y = 3.8767};
  {nom = "Grenoble"; x = 45.1881; y = 5.7325};
  {nom = "Reims"; x = 49.2583; y = 4.0317};
  {nom = "Le Havre"; x = 49.4934; y = 0.1083};
  {nom = "Saint-Etienne"; x = 45.4396; y = 4.3878};
  {nom = "Toulon"; x = 43.1236; y = 5.9300};
  {nom = "Angers"; x = 47.4746; y = -0.5513};
  {nom = "Clermont-Ferrand"; x = 45.7764; y = 3.0847};
  {nom = "Brest"; x = 48.3835; y = -4.4807};
  {nom = "Limoges"; x = 45.8333; y = 1.2500};
  {nom = "Tours"; x = 47.3952; y = 0.6867};
  {nom = "Amiens"; x = 49.8945; y = 2.2957};
  {nom = "Metz"; x = 49.1167; y = 6.1833};
  {nom = "Caen"; x = 49.1833; y = -0.3667};
  {nom = "Orléans"; x = 47.9033; y = 1.9000};
  {nom = "Mulhouse"; x = 47.7333; y = 7.3333};
  {nom = "Rouen"; x = 49.4439; y = 1.0997};
  {nom = "Perpignan"; x = 42.6975; y = 2.8957};
  {nom = "Nancy"; x = 48.6833; y = 6.1833};
  {nom = "Dijon"; x = 47.3220; y = 5.0415};
]   *)


open Printf

(* Définition du type 'ville' *)
type ville = {
  nom: string;
  x: float;
  y: float;
}

(* Liste des villes avec leurs coordonnées *)
let villes = [
  {nom = "Paris"; x = 48.8566; y = 2.3522};
  {nom = "Lyon"; x = 45.7578; y = 4.8320};
  {nom = "Marseille"; x = 43.2965; y = 5.3698};
  {nom = "Bordeaux"; x = 44.8378; y = -0.5792};
  {nom = "Lille"; x = 50.6333; y = 3.0667};
  {nom = "Nantes"; x = 47.2184; y = -1.5536};
  {nom = "Toulouse"; x = 43.6047; y = 1.4442};
  {nom = "Nice"; x = 43.7032; y = 7.2663};
  {nom = "Strasbourg"; x = 48.5734; y = 7.7521};
  {nom = "Rennes"; x = 48.1142; y = -1.6778};
  {nom = "Montpellier"; x = 43.6108; y = 3.8767};
  {nom = "Grenoble"; x = 45.1881; y = 5.7325};
  {nom = "Reims"; x = 49.2583; y = 4.0317};
  {nom = "Le Havre"; x = 49.4934; y = 0.1083};
  {nom = "Saint-Etienne"; x = 45.4396; y = 4.3878};
  {nom = "Toulon"; x = 43.1236; y = 5.9300};
  {nom = "Angers"; x = 47.4746; y = -0.5513};
  {nom = "Clermont-Ferrand"; x = 45.7764; y = 3.0847};
  {nom = "Brest"; x = 48.3835; y = -4.4807};
  {nom = "Limoges"; x = 45.8333; y = 1.2500};
  {nom = "Tours"; x = 47.3952; y = 0.6867};
  {nom = "Amiens"; x = 49.8945; y = 2.2957};
  {nom = "Metz"; x = 49.1167; y = 6.1833};
  {nom = "Caen"; x = 49.1833; y = -0.3667};
  {nom = "Orléans"; x = 47.9033; y = 1.9000};
  {nom = "Mulhouse"; x = 47.7333; y = 7.3333};
  {nom = "Rouen"; x = 49.4439; y = 1.0997};
  {nom = "Perpignan"; x = 42.6975; y = 2.8957};
  {nom = "Nancy"; x = 48.6833; y = 6.1833};
  {nom = "Dijon"; x = 47.3220; y = 5.0415};
]  

(* Fonction pour calculer la distance euclidienne entre deux villes *)
let distance_euclidienne ville1 ville2 =
  sqrt ((ville1.x -. ville2.x) ** 2. +. (ville1.y -. ville2.y) ** 2.)

(* Fonction pour calculer la distance totale d'un parcours *)
let distance_totale parcours =
  let rec aux acc = function
    | [] -> acc
    | [hd] -> acc
    | hd1::hd2::tl -> aux (acc +. distance_euclidienne hd1 hd2) (hd2::tl)
  in
  aux 0. parcours

(* Fonction pour générer une permutation aléatoire d'une liste *)
let permutation_aleatoire liste =
  let nd = List.map (fun c -> (Random.bits (), c)) liste in
  let sorted = List.sort compare nd in
  List.map snd sorted

(* Fonction pour remplacer des segments dans un parcours *)
let remplacer_segments parcours =
  let n = List.length parcours in
  let i = Random.int (n - 1) in
  let j = Random.int (n - 1) in
  if i = j || i = j + 1 || i + 1 = j then
    parcours (* pas de remplacement si les segments se chevauchent *)
  else
    let a = List.nth parcours i in
    let b = List.nth parcours (i + 1) in
    let c = List.nth parcours j in
    let d = List.nth parcours (j + 1) in
    let d1 = distance_totale [a; b; c; d] in
    let d2 = distance_totale [a; d; c; b] in
    if d1 < d2 then
      parcours
      |> List.mapi (fun k x -> if k = i then c else if k = j then a else x)
      |> List.mapi (fun k x -> if k = i + 1 then d else if k = j + 1 then b else x)
    else
      parcours
      |> List.mapi (fun k x -> if k = i then d else if k = j then b else x)
      |> List.mapi (fun k x -> if k = i + 1 then c else if k = j + 1 then a else x)

(* Seuil de température pour le recuit simulé *)
let seuil_temperature = 1.

(* Fonction pour enregistrer les données dans un fichier CSV *)
let save_to_csv file_name data =
  let oc = open_out_gen [Open_append; Open_creat] 0o644 file_name in
  let file_length = in_channel_length (open_in file_name) in
  if file_length = 0 then (
    fprintf oc "Iteration,Distance\n";
    List.iter (fun (x, y) -> fprintf oc "%f,%f\n" x y) data
  ) else (
    List.iter (fun (x, y) -> fprintf oc "%f,%f\n" x y) data
  );
  close_out oc


(* Fonction pour le recuit simulé *)
let recuit_simule temp_initiale taux_refroidissement =
  let rec boucle temp parcours meilleure_distance iterations =
    if temp < seuil_temperature then parcours
    else
      let nouveau_parcours = remplacer_segments parcours in
      let nouvelle_distance = distance_totale nouveau_parcours in
      let data_point = (float_of_int iterations, nouvelle_distance) in
      save_to_csv "data.csv" [data_point];
      Printf.printf "Parcours : ";
      List.iter (fun ville -> Printf.printf "%s -> " ville.nom) nouveau_parcours;
      Printf.printf "\nDistance : %f\n" nouvelle_distance;
      if nouvelle_distance < distance_totale parcours then begin
        Printf.printf "Accepté car plus court\nTempérature : %f\n\n" temp;
        boucle (temp *. taux_refroidissement) nouveau_parcours nouvelle_distance (iterations + 1)
      end
      else if Random.float 1. < exp (-.(nouvelle_distance -. meilleure_distance) /. temp) then begin
        let probabilite = exp (-.(nouvelle_distance -. meilleure_distance) /. temp) in
        let aleatoire = Random.float 1. in
        Printf.printf "Accepté avec une probabilité de %.3f (nombre aléatoire : %.3f)\nTempérature : %f\n\n" probabilite aleatoire temp;
        boucle (temp *. taux_refroidissement) nouveau_parcours meilleure_distance (iterations + 1)
      end
      else begin
        Printf.printf "Refusé\nTempérature : %f\n\n" temp;
        boucle (temp *. taux_refroidissement) parcours meilleure_distance (iterations + 1)
      end
  in
  let parcours_initial = permutation_aleatoire villes in
  let distance_initiale = distance_totale parcours_initial in
  let iterations = ref 0 in
  save_to_csv "data.csv" []; (* Ajouter les en-têtes de colonnes au fichier CSV *)
  boucle temp_initiale parcours_initial distance_initiale !iterations

(* Point d'entrée du programme *)
let () =
  Random.self_init ();
  print_string "Entrez la température initiale : ";
  let temp_initiale = read_float () in
  print_string "Entrez le taux de refroidissement : ";
  let taux_refroidissement = read_float () in
  if temp_initiale <= 0. || taux_refroidissement <= 0. then
    print_endline "La température initiale et le taux de refroidissement doivent être positifs."
  else begin
    let resultat = recuit_simule temp_initiale taux_refroidissement in
    print_endline "Parcours optimisé:";
    List.iter (fun ville -> print_string (ville.nom ^ " -> ")) resultat;
    print_endline "";
    print_endline ("Distance totale : " ^ string_of_float (distance_totale resultat))
  end
