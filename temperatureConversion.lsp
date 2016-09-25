;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Temperature Conversion function: Receives a list containing two pieces of data, a number
;; and a letter. The number is a value for a temperature, and the letter is either C or F
;; (meaning Centigrade or Fahrenheit). The function converts C to F or F to C depending
;; on which letter it recieves
;; parameters:
;;		lst - the list containing the required information
;; limitations:
;;		1. the parameter list must contain correct datatypes in the 
;; assumed order: '(int char)
;;		2. The 'F' or 'C' in the list must be a capitalized character

(defun convert (lst)
	(cond
		((char= (first (rest lst)) #\C) (C-to-F (first lst)))
		((char= (first (rest lst)) #\F) (F-to-C (first lst)))
		(T "invalid character")
	)
)

;; helper function that takes in the integer to be converted from C to F
;; follows the formula F = (C * 1.8) + 32	
;; parameters: num - the number in C to be converted to F.
(defun C-to-F (num)
	(+ (* num 1.8) 32)
)

;; helper function that takes in the integer to be converted from F to C
;; follows the formula C = (F - 32) / 1.8
;; parameters: num - the number in F to be converted to C.
(defun F-to-C (num)
	(/ (- num 32) 1.8)
)
	
;; test plan for Temperature Conversion:
;; category				data			expected result
;;-----------------------------------------------
;; C-to-F				'(100 C)		212
;; C-to-F (neg)			'(-25 C)		-13
;; C-to-F (dec answer)	'(2 C)			approx 35.6
;; C-to-F (dec input)	'(54.45 C)		approx 130.01	
;; F-to-C				'(212 F)		100
;; F-to-C (neg)			'(-13 F)		-25
;; F-to-C (dec answer)	'(0 F)			approx -17.7778
;; F-to-C (dec input)	'(25.78 F)		approx -3.46

(print (convert '(100 #\C)))
(print (convert '(-25 #\C)))
(print (convert '(2 #\C)))
(print (convert '(54.45 #\C)))
(print (convert '(212 #\F)))
(print (convert '(-13 #\F)))
(print (convert '(0 #\F)))
(print (convert '(25.78 #\F)))

