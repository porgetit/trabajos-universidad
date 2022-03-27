#lang racket
(define (deUnoaN n contador)
  (if (< contador n)
      (begin (displayln contador)
             (deUnoaN n (+ contador 1))
             )
      (begin (displayln contador))
      )
  )
;(deUnoaN 10 1)

(define (deNaUno n)
  (if (> n 1)
      (begin (displayln n)
             (deNaUno (- n 1))
             )
      (begin (display n))
      )
  )
;(deNaUno 10)

(define (mayor->menor a b)
  (if (> a b)
      (begin (displayln a)
             (mayor->menor (- a 1) b)
             )
      (begin (displayln a))
      )
  )

(define (menor->mayor a b)
  (if (< a b)
      (begin (displayln a)
             (menor->mayor (+ a 1) b)
             )
      (begin (displayln a))
      )
  )

(define (numN->M n m)
  (cond
    ((> n m) (mayor->menor n m))
    ((< n m) (menor->mayor n m))
    )
  )

;(numN->M 20 10)

(define (x2x3_N->M n m)
  (cond
    ((> n m)
     (begin (display n)(display "\t")(display (* n n)) (display "\t") (displayln (* n n n))
                (x2x3_N->M (- n 1) m)
                )
     )
    ((< n m)
     (begin (display n)(display "\t")(display (* n n)) (display "\t") (displayln (* n n n))
                (x2x3_N->M (+ n 1) m)
                )
     )
    (else
     (begin (display n)(display "\t")(display (* n n)) (display "\t") (displayln (* n n n)))
     )
    )
  )
;(x2x3_N->M 4 1)

(define (sumaFactorial n m acumulado)
  (cond
    ((< n m) (begin
               (sumaFactorial (+ n 1) m (+ acumulado n))
               ))
    ((> n m) (begin
               (sumaFactorial (- n 1) m (+ acumulado n))
               ))
    (else
     (displayln (+ acumulado n))
     )
    )
  )

;(sumaFactorial 15 7 0)

(define (contar n m contador)
  (cond
    ((< n m) (begin
               (contar (+ n 1) m (+ contador 1))
               ))
    ((> n m) (begin
               (contar (- n 1) m (+ contador 1))
               ))
    (else
     (displayln (+ contador 1))
     )
    )
  )

;(contar 3 8 0)

(define (pares n m)
  (cond
    ((< n m) (begin
               (if (= (remainder n 2) 0)
                   (begin
                     (displayln n)
                     (pares (+ n 1) m)
                     )
                   (begin (pares (+ n 1) m))
                   )
               ))
    ((> n m) (begin
               (if (= (remainder n 2) 0)
                   (begin
                     (displayln n)
                     (pares (- n 1) m)
                     )
                   (begin (pares (- n 1) m))
                   )
               ))
    (else
     (cond
       ((= (remainder n 2) 0) (displayln n))
       )
     )
    )
  )

;(pares 9 2)

(define (impares n m)
  (cond
    ((< n m) (begin
               (if (not (= (remainder n 2) 0))
                   (begin
                     (displayln n)
                     (impares (+ n 1) m)
                     )
                   (begin (impares (+ n 1) m))
                   )
               ))
    ((> n m) (begin
               (if (not (= (remainder n 2) 0))
                   (begin
                     (displayln n)
                     (impares (- n 1) m)
                     )
                   (begin (impares (- n 1) m))
                   )
               ))
    (else
     (cond
       ((not (= (remainder n 2) 0)) (displayln n))
       )
     )
    )
  )

;(impares 0 11)

(define (sumaPares n m acumulador)
  (cond
    ((< n m) (begin
               (if (= (remainder n 2) 0)
                   (begin                  
                     (sumaPares (+ n 1) m (+ acumulador n))
                     )
                   (begin (sumaPares (+ n 1) m acumulador))
                   )
               ))
    ((> n m) (begin
               (if (= (remainder n 2) 0)
                   (begin
                     (sumaPares (- n 1) m (+ acumulador n))
                     )
                   (begin (sumaPares (- n 1) m acumulador))
                   )
               ))
    (else
     (cond
       ((= (remainder n 2) 0) (displayln (+ acumulador n)))
       (else (displayln acumulador))
       )
     )
    )
  )

;(sumaPares 5 2 0)

(define (sumaImpares n m acumulador)
  (cond
    ((< n m) (begin
               (if (not (= (remainder n 2) 0))
                   (begin                  
                     (sumaImpares (+ n 1) m (+ acumulador n))
                     )
                   (begin (sumaImpares (+ n 1) m acumulador))
                   )
               ))
    ((> n m) (begin
               (if (not (= (remainder n 2) 0))
                   (begin
                     (sumaImpares (- n 1) m (+ acumulador n))
                     )
                   (begin (sumaImpares (- n 1) m acumulador))
                   )
               ))
    (else
     (cond
       ((not (= (remainder n 2) 0)) (displayln (+ acumulador n)))
       (else (displayln acumulador))
       )
     )
    )
  )

;(sumaImpares 5 0 0)