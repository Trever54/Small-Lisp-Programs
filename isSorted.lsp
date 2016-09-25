;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Is Sorted function: receives a list of integers and returns true or nil for whether
;; the list is sorted ascending.
;; parameters:
;;		lst - the list to be examined
;; limitations:
;;		1. The parameter list can only contain integers

(defun isSorted (lst)
	(cond
		((null lst) T)									
		((= (length lst) 1) T)								
		((<= (first lst) (first (rest lst))) (isSorted (rest lst)))	
		(T nil)														
	)
)
	
;; test plan for Is Sorted:
;; category							data					expected result
;;---------------------------------------------------------------------------
;; positive integers sorted			'(1 3 5 6 11)			true
;; negative integers not sorted		'(-1 -3 -5 -6 -11)		nil
;; pos, neg, and 0 sorted			'(-6 -3 0 2 4)			true
;; with duplicates sorted			'(-1 -1 2 3 4 4 4 4 8)	true
;; with duplicates not sorted		'(-1 -1 -8 4 3 3 3 2)	nil
;; empty list						'()						true

(print (isSorted '(1 3 5 6 11)))
(print (isSorted '(-1 -3 -5 -6 -11)))
(print (isSorted '(-6 -3 0 2 4)))
(print (isSorted '(-1 -1 2 3 4 4 4 4 8)))
(print (isSorted '(-1 -1 -8 4 3 3 3 2)))
(print (isSorted '()))