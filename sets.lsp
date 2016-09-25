;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Sets function: Implements the regular set operations union, intersection, 
;; and member for top-level lists.
;; parameters:
;;		lstA - the first list to be examined (for union/intersection)
;;		lstB - the second list to be examined (for union/intersection)
;;		lst - the list to be examined (for member)
;;		elem - the element to be found (for member)
;; limitations:
;;		1. All functions assume there are no nested lists

(defun myUnion (lstA lstB)
	(cond
		((null lstA) lstB)
		((null lstB) lstA)
		(T (myUnionHelper lstA lstB))
	)	
)

;; helper method that returns the union of the two lists given that both
;; lists contain elements
(defun myUnionHelper (lstA lstB)
	(cond
		((null lstA) '())
		((not (myMember (first lstA) lstB)) 
			(append (list (first lstA)) lstB (myUnionHelper (rest lstA) lstB)))
		(T (myUnionHelper (rest lstA) lstB))
	)
)

(defun myIntersection (lstA lstB)
	(cond
		((null lstA) '())
		((null lstB) '())
		((<= (length lstA) (length lstB)) (myIntersectionHelper lstA lstB))
		((> (length lstA) (length lstB)) (myIntersectionHelper lstB lstA))
		(T (myIntersection  (rest lstA) lstB))
	)
)

;; helper method that takes the intersection of two lists given that
;; the lists both contain at least one element each and that lstA <= lstB
(defun myIntersectionHelper (lstA lstB)
	(cond
		((null lstA) '())
		((myMember (first lstA) lstB) 
			(append (list (first lstA)) (myIntersectionHelper (rest lstA) lstB)))
		(T (myIntersectionHelper  (rest lstA) lstB))
	)
)

(defun myMember (elem lst)
	(cond
		((null lst) nil)
		((equal elem (first lst)) T)
		(T (myMember elem (rest lst)))
	)
)
	
;; test plan for Sets:
;; category						data												expected result (any order for the lists)
;;-----------------------------------------------------------------------------------------------------
;; Union						'(1 2 3) '(2 3 4)									'(1 2 3 4)
;; Union						'("the" #\T) '("the" 1 2 3)							'("the" #\T 1 2 3)
;; Union (one empty list)		'() '(1 2 3)										'(1 2 3)
;; Union (two empty lists)		'() '()												nil
;; Intersection					'(1 2 3) '(3 4 5)									'(3)			
;; Intersection					'("the" #\T "t" #\L 4 4) '("the" 3 #\L 3 2)			'("the #\L")
;; Intersection					'("the" 3 #\L 3 2) '("the" #\T "t" #\L 4 4)			'("the #\L")
;; Intersection (one empty)		'(1 2 3) '()										nil
;; Intersection (two empty)		'() '()												nil
;; Member						1 '(1 2 3)											true					
;; Member						"the" '("t" #\T)									nil
;; Member						"the" '(1 2 "the" "the")							true
;; Member						#\T '(1 2 3 #\A #\B #\T)							true
;; Member (empty list)			"test" '()											nil

(print (myUnion '(1 2 3) '(2 3 4)))
(print (myUnion '("the" #\T) '("the" 1 2 3)))
(print (myUnion '() '(1 2 3)))
(print (myUnion '() '()))
(print '----------)
(print (myIntersection '(1 2 3) '(3 4 5)))
(print (myIntersection '("the" #\T "t" #\L 4 4) '("the" 3 #\L 3 2)))
(print (myIntersection '("the" 3 #\L 3 2) '("the" #\T "t" #\L 4 4)))
(print (myIntersection '(1 2 3) '()))
(print (myIntersection '() '()))
(print '----------)
(print (myMember 1 '(1 2 3)))
(print (myMember "the" '("t" #\T)))
(print (myMember "the" '(1 2 "the" "the")))
(print (myMember #\T '(1 2 3 #\A #\B #\T)))
(print (myMember "test" '()))








