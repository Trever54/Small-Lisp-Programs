;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Divide by 5 counter function: receives a list of numbers and returns a count of how many are
;; divisible by 5. Uses a helper method predicate function that returns true if its numeric
;; argument is evenly divisible by 5
;; parameters:
;;		lst - the list of elements to be examined
;; limitations:
;;		None

(defun divideBy5Count (lst)
	(cond
		((null lst) 0)
		((divisibleBy5 (first lst)) (+ 1 (divideBy5Count (rest lst))))
		(T (divideBy5Count (rest lst)))
	)
)

;; helper function that returns true if the argument is numeric and divisible by 5
;; parameters: num - the element to be checked whether or not it is a number 
;; divisible by 5
(defun divisibleBy5 (num)
	(cond
		((not (numberp num)) nil)
		((not (eql (mod num 5) 0)) nil)
		(T T)
	)
)	
	
;; test plan for Divide by 5 Counter:
;; category										data					expected
;;--------------------------------------------------------------------------------
;; list contains numbers divisibile by 5		'(1 5 25 3 222 0)		3
;; list contains numbers, none divisible by 5	'(1 22 8 506)			0
;; list contains numbers and non-numbers		'("s" 5 "10" 10 22)		2
;; list contains only non-numbers				'("test" "so" "n")		0
;; empty list									'()						0
;; list containing characters					'(1 5 #\5 25 #\C 2)		2
;; list containing words						'(5 word 6)				1
;; list containing a bit of everything			'("test" 5 #\C word 1)	1

(print (divideBy5Count '(1 5 25 3 222 0)))
(print (divideBy5Count '(1 22 8 506)))
(print (divideBy5Count '("s" 5 "10" 10 22)))
(print (divideBy5Count '("test" "so" "n")))
(print (divideBy5Count '()))
(print (divideBy5Count '(1 5 #\5 25 #\C 2)))
(print (divideBy5Count '(5 word 6)))
(print (divideBy5Count '("test" 5 #\C word 1)))



