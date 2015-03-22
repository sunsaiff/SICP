#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (fold-right op init seq)
  (accumulate op init seq))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define (append x y)
  (if (null? x)
      y
      (cons (car x)
            (append (cdr x) y))))
       


(define (reverse-1 x)
  (fold-left (lambda (result this)
                (cons this result))
              '()
              x))

(define (reverse-2 x)
  (fold-right (lambda (this result)
                (append result (list this)))
              '()
              x))