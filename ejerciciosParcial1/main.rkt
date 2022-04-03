#lang racket

(define (fib n)
  (define y (/ (+ 1 (sqrt 5)) 2))
  (define j (/ (- (expt y n) (expt (- 1 y) n)) (sqrt 5)))
  (if (< n 2)
      (begin
        n
        )
      (begin
        j
        )
      )
  )

(define (f x)
  (+ x (expt x x))
  )

(define (principal-1)
  (begin
    (displayln "Ejercicio número 4 (Kevin Esguerra Cardona)")
    (display "Ingrese un número: ")
    (define n (read))
    (display "Término fibonnaci -> ")
    (displayln (fib n))
    (display "Resultado de la ecuación -> ")
    (displayln (f (fib n)))
    )
  )

(define (principal-2) (display "ejercicio 2"))

(define (principal-3) (display "ejercicio 3"))

(define (principal-4) (display "ejercicio 4"))

(define (principal-5) (display "ejercicio 5"))

(define (principal-6) (display "ejercicio 6"))

(define (principal-7) (display "ejercicio 7"))

(define (principal-8) (display "ejercicio 8"))

(define (principal-9) (display "ejercicio 9"))

(define (principal-10) (display "ejercicio 10"))

(define (menu)
  (begin
    (display "Ingrese un número [1-10]: ")
    (define numero (read))
    (cond
      ((= numero 1) (principal-1))
      ((= numero 2) (principal-2))
      ((= numero 3) (principal-3))
      ((= numero 4) (principal-4))
      ((= numero 5) (principal-5))
      ((= numero 6) (principal-6))
      ((= numero 7) (principal-7))
      ((= numero 8) (principal-8))
      ((= numero 9) (principal-9))
      ((= numero 10) (principal-10))
      (else
       (begin
         (displayln "Opción inválida")
         (menu)
         )
       )
      )
    )
  )

(menu)