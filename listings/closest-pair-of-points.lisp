(defun introduce-sorting-info (lst-of-point-definitions)
  (mapcar (function 
	   (lambda (point-definition) 
	    (append point-definition 
		    (list :x-position -1 :y-position -1)))) 
	  lst-of-point-definitions))

(defun sort-by-ascissa (lst)
  (sort (copy-list lst) (function <) :key 
	(function 
	 (lambda (lst-of-point-info) 
	  (getf lst-of-point-info :x)))))

(defun make-set-of-point-definition (lst-of-pairs)
  (mapcar (function
	   (lambda (pair) 
	    (list :x (car pair) :y (car (cdr pair))))) 
	  lst-of-pairs))

(defun assign-ordinate-position (lst pos)
  (if (null lst)
      ()
      (progn
	(setf (getf (car lst) :y-position) pos)
	(assign-ordinate-position (cdr lst) (+ pos 1)))))

(defun sort-by-ordinate (lst)
  (sort (copy-list lst) (function <) :key 
	(function 
	 (lambda (lst-of-point-info) 
	  (getf lst-of-point-info :y)))))

(defun assign-ascissa-position (lst pos)
  (if (null lst) 
      ()
      (progn
	(setf (getf (car lst) :x-position) pos)
	(assign-ascissa-position (cdr lst) (+ pos 1)))))


(defun dummy-test ()
  (sort-by-ascissa 
   (introduce-sorting-info 
    (make-set-of-point-definition (list '(5 2) '(1 10) '(3 4))))))

(defun e ()
  "A badly indented function."
  (let ((x 20))
    (loop for i from 0 to x 
       do (loop for j from 0 below 10 
	     do (print j)) 
       (if (< i 10)
	   (let ((z nil) )
	     (setq z (format t "x=~d" i))
	     (print z))))))