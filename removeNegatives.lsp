;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Remove Negatives Function: receives a list of integers and returns a list with
;; all negative values removed.
;; parameters:
;;		lst - the list of numbers to be examined
;; limitations:
;;		1. Will not support a list that contains any non-integer values

(defun removeNegatives (lst)
	(cond
		((null lst) nil)										
		((< (first lst) 0) (removeNegatives (rest lst)))				
		(T (append (list (first lst)) (removeNegatives (rest lst))))	
	)
)
	
;; test plan for Remove Negatives:
;; category						data					expected result
;;---------------------------------------------------------------------------
;; no negatives					'(1 2 3)				'(1 2 3)
;; all negatives				'(-1 -2 -3)				nil
;; half and half				'(1 -2 3 -4)			'(1 3)
;; empty list					'()						nil
;; list with 0 (should be pos)	'(0 1 2 -1)				'(0 1 2)

(print (removeNegatives '(1 2 3)))
(print (removeNegatives '(-1 -2 -3)))
(print (removeNegatives '(1 -2 3 -4)))
(print (removeNegatives '()))
(print (removeNegatives '(0 1 2 -1)))