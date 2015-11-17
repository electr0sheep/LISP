(defun foo (x L)
    (if (null L) nil
        (if (= x (car L)) T
            (foo x (cdr L))
        )
    )
)

(format t "~D" (foo 4 '(1 2 3)))
