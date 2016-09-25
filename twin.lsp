;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Twin function: Receives a list of anything, not nested, and doubles all elements
;; parameters:
;;		lst - the list to have its elements doubled
;; limitations:
;;		None

(defun twin (lst)
	(cond
		((null lst) '())
		(T (append (list (first lst) (first lst)) (twin (rest lst))))
	)
)
	
;; test plan for Twin:
;; category									data					expected result
;;------------------------------------------------------------------------------------------
;; simple integer list (no duplicates)		'(1 2 3 4 5)			'(1 1 2 2 3 3 4 4 5 5)		
;; simple integer list (duplicates)			'(1 2 2 3)				'(1 1 2 2 2 2 3 3)
;; multiple type list (no duplicates)		'(1 "two" #\3)			'(1 1 "two" "two" #\3 #\3)
;; multiple type list (duplicates)			'(1 "two" two #\a)		'(1 1 "two" "two" two two #\a #\a)
;; empty list								'()						nil

(print (twin '(1 2 3 4 5)))
(print (twin '(1 2 2 3)))
(print (twin '(1 "two" #\3)	))
(print (twin '(1 "two" two #\a)))
(print (twin '()))