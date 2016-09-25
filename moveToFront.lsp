;; Trever Mock - CS 3210 - Spring 2016
;; ===================================
;; Move to Front function: Takes a word and a list of words. If the word is not in
;; the list, it is added at the front. If the word is in the list, it is moved to the front
;; parameters:
;;		word - the word to be added to the front or moved up front in the list
;;		lst - the list of words to be checked with the word parameter
;; limitations:
;;		1. If the list contains duplicates of the word parameter, the duplicates of that word
;; are deleted when the word is moved to the front of the list.
;;		2. If a String contains more than one word, the entire string is still only counted as one word.

(defun moveToFront (word lst)
	(cond
		((contains word lst) 			;; if the word is in the list, move it to the front
			(append (list word) (deleteElement word lst))
		)
		(T (append (list word) lst))	;; else, add it to the front
	)
)

;; helper function that returns true if the word parameter 
;; is an element of the list parameter in; 
;; false otherwise
(defun contains (word lst)
	(cond
		((null lst) nil)				;; if list is empty, return nil
		((equal word (first lst)) T)	;; if the word matches, return true
		(T (contains word (rest lst)))	;; else, call this function with the rest of the list
	)
)

;; helper function that appends a new list without any elements matching the parameter word
(defun deleteElement (word lst)
	(cond
		((null lst) nil)												;; if empty, return nil
		((equal word (first lst)) (deleteElement word (rest lst)))		;; if it's the word, call recursively	
		(T (append (list (first lst)) (deleteElement word (rest lst))))	;; if it's not the word, append and call recursively
	)
)
	
;; test plan for Move to Front:
;; category									data									expected result
;;-------------------------------------------------------------------------------------------------------------
;; word isn't in list						"zero" '("one" "two" "three")			'("zero" "one" "two" "three")
;; word isn't in list and list is empty		"test" '()								'("test")
;; word is the only word in list			"test" '("test")						'("test")
;; word is first in the list				"zero" '("zero" "one" "two")			'("zero" "one" "two")
;; word is in the middle of the list		"zero" '("one" "two" "zero" "three")	'("zero" "one" "two" "three")
;; word is last in the list					"zero" '("one" "two" "three" "zero")	'("zero" "one" "two" "three")
;; word is an empty string					"" '("test")							'("" "test")
;; using actual 'words'
;; word isn't in list						'zero '('one 'two 'three)				'(zero one two three)
;; word isn't in list and list is empty		'test '()								'(test)
;; word is in the middle of the list		'zero '('one 'two 'zero 'three)			'(zero one two three)

(print (moveToFront "zero" '("one" "two" "three")))
(print (moveToFront "test" '()))
(print (moveToFront "test" '("test")))
(print (moveToFront "zero" '("zero" "one" "two")))
(print (moveToFront "zero" '("one" "two" "zero" "three")))
(print (moveToFront "zero" '("one" "two" "three" "zero")))
(print (moveToFront "" '("test")))
(print (moveToFront 'zero '(one two three)))
(print (moveToFront 'test '()))
(print (moveToFront 'zero '(one two zero three)))