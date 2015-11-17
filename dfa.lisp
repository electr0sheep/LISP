; define a list of pair. ` similar to ' which
; means the following is a data list. ",x" is the value of x.
(defun pair (x y) `(,x ,y))


; define the transition function
(defun transition (currentS symbol)
 (let ((inputPair (pair currentS symbol)))
  (cond
	((equal inputPair '(q0 1)) 'q1)
	((equal inputPair '(q0 0)) 'q2)
	((equal inputPair '(q1 1)) 'q0)
	((equal inputPair '(q1 0)) 'q3)
	((equal inputPair '(q2 1)) 'q3)
	((equal inputPair '(q2 0)) 'q0)
	((equal inputPair '(q3 1)) 'q2)
	((equal inputPair '(q3 0)) 'q1)
    (t nil)
  )
 )
)


; definition of dfa: three components -- start state, transition function
; and final states

(defun dfa (component)
  (case component
	('start 'q0)
	;to use the function name "transition", we need prefix it with #'
	('transition #'transition)
	('final   '(q0))))

; isFinal(s) true if s is final, nil otherwise
(defun isFinal (s)
  (member s (dfa 'final))
)

; I COULDN'T FIGURE OUT HOW TO GET THIS FUNCTION TO WORK SO I JUST BAGGED IT
; getNextState(s, c): returns the next state given a state s and a symbol c.
;(defun getNextState (s c)
;  (apply dfa `(,s ,c))
;)


; scan(s, input): print the states automata goes through in terms of input.
;  	              print ACCEPT if input is accepted by the automata, REJECT otherwise
(defun scan (s input)
  (format t "~D " s)
  (if (car input)
    (scan (transition s (car input)) (cdr input))
    ;(scan (getNextState s (car input)) (cdr input))
    (if (isFinal s) (format t "ACCEPT")
      (format t "REJECT")
    )
  )
  (values)
)
