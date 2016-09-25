;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; n factorial function: Takes a positive integer and returns its factorial
;; parameters:
;;		n - the positive integer to take the factorial of
;; limitations:
;;		1. Will only work for positive integers and 0

(defun factorial (n)
	(cond 
		((eql n 0) 1)					;; if 0, then return 1		
		(T  (* n (factorial (- n 1))))	;; if not 0, then call recursively
	)
)	

;; test plan for factorial:
;; category						data	expected result
;;-----------------------------------------------
;; base case					0		1
;; not base case				1		1
;; not base case				3		6
;; not base case				5		120
;; not base case (larger)		10		3628800	

(print (factorial 0))
(print (factorial 1))
(print (factorial 3))
(print (factorial 5))
(print (factorial 10))

(setf data1 0)
(setf data2 1)
(setf data3 3)
(setf data4 5)
(setf data5 10)