#lang racket
(define (problema-11)
  (define (print.display a b c)
    (display a)(display " ")(display b)(display " ")(display c)(newline)
    )

  (define (print.descend a b c)
    (cond
      ((and (> a b) (> a c))
       (cond
         ((> b c) (print.display a b c))
         ((> c b) (print.display a c b))
         )
       )
      ((and (> b a) (> b c))
       (cond
         ((> a c) (print.display b a c))
         ((> c a) (print.display b c a))
         )
       )
      ((and (> c a) (> c b))
       (cond
         ((> a b) (print.display c a b))
         ((> b a) (print.display c b a))
         )
       )
      )
    )
  (define (principal-11)
    (begin
      (display "Ingrese los datos A, B y C [A B C]: ")
      (define A (read))
      (define B (read))
      (define C (read))
      (print.descend A B C)
      )
    )
  (principal-11)
  )

(define (problema-12)
  (define (miles numero)
    (floor (/ numero 1000))
    )
  (define (centenas numero)
    (define x (remainder numero 1000))
    (floor (/ x 100))
    )
  (define (decenas numero)
    (define x (remainder numero 1000))
    (define y (remainder x 100))
    (floor (/ y 10))
    )
  (define (unidades numero)
    (define x (remainder numero 1000))
    (define y (remainder x 100))
    (remainder y 10)
    )

  (define (invert.digits numero)
    (define a (unidades numero))
    (define b (decenas numero))
    (define c (centenas numero))
    (define d (miles numero))
    (display a)
    (display b)
    (display c)
    (display d)
    (newline)
    )
  #|
    a -> unidades
    b -> decenas
    c -> centenas
    d -> miles
|#

  (define (principal-12)
    (begin
      (display "Ingrese el número a cifrar: ")
      (define numero (read))
      (invert.digits numero)
      )
    )
  (principal-12)
  )