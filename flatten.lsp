;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Flatten function: Receives a list of arbitrary depth, and returns a list 
;; containing all the same elements in the same order, but now at the top level
;; parameters:
;;		lst - the list to be 'flattened'
;; limitations:
;;		1. If an element is 'QUOTE, it will not be included in the flattened list

(defun flatten (lst)
	(cond
		((null lst) (append '()))
		((equal (first lst) 'QUOTE) (flatten (rest lst)))
		((listp (first lst)) (append (flatten (first lst)) (flatten (rest lst))))
		(T (append (list (first lst)) (flatten (rest lst))))
	)
)
	
;; test plan for flatten:
;; category						data						expected result
;;-------------------------------------------------------------------------
;; 1 level of depth				'(1 2 3 '(4 5) 6)			'(1 2 3 4 5 6)
;; several levels of depth		'(1'(2)3'(4 '(5) 6) 7)		'(1 2 3 4 5 6 7)
;; several levels of depth		'("t" '(1 '(#\C '(2))) 3)	'("t" 1 #\C 2 3)
;; empty lists					'('('())'())				'()
;; one empty list				'()							'()
;; no depth						'(1 2 3 4 5)				'(1 2 3 4 5)

(print (flatten '(1 2 3 '(4 5) 6)))
(print (flatten '(1'(2)3'(4 '(5) 6) 7)))
(print (flatten '("t" '(1 '(#\C '(2))) 3)))
(print (flatten '('('())'())))
(print (flatten '()))
(print (flatten '(1 2 3 4 5)))