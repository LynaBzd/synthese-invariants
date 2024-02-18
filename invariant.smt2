; Invar prend deux entiers et renvoie une valeur de vérité 
; configuration à l'intérieur de l'invariant
(declare-fun Invar (Int Int) Bool)

; On vérifie que Invar contient la configuration initiale
(assert (Invar 0 0))

; On vérifie que Invar est un invariant de boucle
(assert (forall ((i Int) (v Int))
	(=> (and (Invar i v) (< i 3)) (Invar (+ i 1) (+ v 3)))))

; si pout tout x, y dans l'invariant && x>= 10, alors y<10
(assert (forall ((i Int) (v Int ))
	(=> (and (Invar i v) (>= i 3)) (= v 9))))

; on fait appel au solveur pour la vérification de  la satisfiabilité
; des 3 conjonctions
(check-sat-using (then qe smt))
(get-model)
(exit)