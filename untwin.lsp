;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Untwin function: Receives a list with any elements, not nested, 
;; some of which may be paired, and removes one of each pair.
;; Pairs are defined as two elements which are the same and directly
;; next to each other in the list.
;; parameters:
;;		lst - the list to have pairs deleted from
;; limitations:
;;		1. If there are three numbers in a row in a list, only one is 
;; removed (paired with the second) so that the new list will contain
;; two numbers in a row. Test case 4 shows an example of this situation

(defun untwin (lst)
	(cond
		((null lst) '())
		((equal (first lst) (first (rest lst))) (append (list (first (rest lst))) (untwin (rest (rest lst)))))
		(T (append (list (first lst)) (untwin (rest lst))))
	)
)
	
;; test plan for Untwin:
;; category								data								expected result
;;------------------------------------------------------------------------------------------------------
;; int list with all pairs 				'(1 1 2 2 3 3)						'(1 2 3)
;; int list with some pairs				'(1 1 2 3 3 4)						'(1 2 3 4)
;; two similar matching pairs			'("t" "t" "s" 2 3 "s" "t" "t")		'("t" "s" 2 3 "s" "t")
;; chars, strings, and numbers			'(#\H "th" he "he" 1 1 #\C #\C)		'(#\H "th" he 1 #\C)
;; three in a row						'(1 1 1 2 2 3 4 4 1 1 4)			'(1 1 2 3 4 1 4)
;; no pairs								'(1 2 3 4 5)						'(1 2 3 4 5)
;; no pairs, but doubles				'(1 3 1 3)							'(1 3 1 3)
;; empty list							'()									nil

(print (untwin '(1 1 2 2 3 3)))
(print (untwin '(1 1 2 3 3 4)))
(print (untwin '("t" "t" "s" 2 3 "s" "t" "t")))
(print (untwin '(#\H "th" he "he" 1 1 #\C #\C)))
(print (untwin '(1 1 1 2 2 3 4 4 1 1 4)))
(print (untwin '(1 2 3 4 5)))
(print (untwin '(1 3 1 3)))
(print (untwin '()))


