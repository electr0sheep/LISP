(defun max (a b c)
    (if (> a b)
        (if (> a c) a c)
        (if (> b c) b c)
    )
)

(format t "~D" (max 5 9 1))
