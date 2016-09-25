;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Search function: receives an integer and a list. The list will have a mix of 
;; integers, characters, and words, and may have nested lists. The function 
;; returns a count of how many times the integer value is found.
;; parameters:
;;		num - the integer parameter to be searched for in the list
;;		lst - the list parameter to be searched through
;; limitations:
;;		None

(defun mySearch (num lst)
	(cond
		((null lst) 0)												
		((listp (first lst)) (+ (mySearch num (first lst)) (mySearch num (rest lst))))
		((not (numberp (first lst))) (mySearch num (rest lst)))						
		((= num (first lst)) (+ 1 (mySearch num (rest lst))))							
		(T (mySearch num (rest lst)))								
	)
)
	
;; test plan for Search:
;; category								data											expected result
;;-------------------------------------------------------------------------------------------------------
;; only numbers							1 '(1 2 1 1 3 3 5 1)							4
;; numbers and non-numbers				3 '(1 "string" 3 #\s 3)							2	
;; nested lists with only numbers		5 '(5 3 '(1 2 3) 5 '(5 3 5) 5)					5
;; nested lists with non-numbers		0 '('(0 the #\c) 0 1 '("test" #\a) "end")		2	
;; nested list, no numbers found		0 '(2 '(3 4) #\t '("one") '(5 6) end)			0
;; empty list							1 '()											0
;; double nested list					1 '(1 0 '(1 2 3 '(1 0 0) 1) 1)					5

(print (mySearch 1 '(1 2 1 1 3 3 5 1)))
(print (mySearch 3 '(1 "string" 3 #\s 3)))
(print (mySearch 5 '(5 3 '(1 2 3) 5 '(5 3 5) 5)))
(print (mySearch 0 '(0 1 '(0 the #\c) '("test" #\a) "end")))
(print (mySearch 0 '(2 '(3 4) #\t '("one") '(5 6) end)))
(print (mySearch 1 '()))
(print (mySearch 1 '(1 0 '(1 2 3 '(1 0 0) 1) 1)))
