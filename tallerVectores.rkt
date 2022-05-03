#lang racket

(define vec1 (vector 2 5 6 2 7 8))

(define (llenar vec iter)
  (cond
    ((< iter (vector-length vec))
      (begin
        (vector-set! vec iter (read))
        (llenar vec (add1 iter))
        ))
    )
  )

(define (mostrar vec iter)
  (cond
    (
     (< iter (vector-length vec))
     (begin
       (display (vector-ref vec iter))(display " ")
       (mostrar vec (add1 iter))
       )
     )
    )
  )

(define (ejercicio_1 vec iter acum)
  (if (< iter (vector-length vec))
      (begin
        (cond ((odd? (vector-ref vec iter))
               (ejercicio_1 vec (add1 iter) (+ acum (vector-ref vec iter)))
               )
              (else
               (ejercicio_1 vec (add1 iter) acum)
               ))
        )
      (begin
        acum
        )
      )
  )

;(ejercicio_1 vec1 0 0)

(define (ejercicio_3 vec iter recipe pos)
  (cond
    ((= iter 0)
     (begin
       (ejercicio_3 vec (add1 iter) (vector-ref vec iter) iter)
       )
     )
    ((< iter (vector-length vec))
     (begin
       (cond ((< (vector-ref vec iter) recipe)
              (ejercicio_3 vec (add1 iter) (vector-ref vec iter) iter)
              )
             (else
              (ejercicio_3 vec (add1 iter) recipe pos)
              ))
       )
     )
    (else
     (display recipe)(display " -> ")(display (add1 pos))
     )
    )
  )

;(ejercicio_3 vec1 0 0 0)

(define (ejercicio_5 vec iter cont)
  (if (< iter (sub1 (vector-length vec)))
      (begin
        (cond ((< (vector-ref vec iter) (vector-ref vec (add1 iter)))
               (ejercicio_5 vec (add1 iter) cont)
               )
              (else
               (display "No está ordenado i<j")
               ))
        )
      (begin
        (display "Está ordenado i<j")
        )
      )
  )

;(ejercicio_5 vec1 0 0)

(define (ejercicio_7 vec n cont)
  (if (<= cont n)
      (begin
        (cond ((odd? cont)
               (begin
                 (ejercicio_7 vec n (add1 cont))
                 )
               )
              (else
               (ejercicio_7 (vector-append vec (vector cont)) n (add1 cont))
               ))
        )
      (begin
        (display "Este es tu vector: ")
        (mostrar vec 0)
        )
      )
  )

;(ejercicio_7 (make-vector 0) 30 1)

(define (ejercicio_9 vec iter vec_par vec_impar)
  (if (< iter (vector-length vec))
      (begin
        (cond ((odd? (vector-ref vec iter))
               (ejercicio_9 vec (add1 iter) vec_par (vector-append vec_impar (vector (vector-ref vec iter))))
               )
              (else
               (ejercicio_9 vec (add1 iter) (vector-append vec_par (vector (vector-ref vec iter))) vec_impar)
               ))
        )
      (begin
        (display "Pares: ")
        (mostrar vec_par 0)
        (newline)
        (display "Impares: ")
        (mostrar vec_impar 0)
        )
      )
  )

;(ejercicio_9 vec1 0 (make-vector 0) (make-vector 0))

(define vec3 (make-vector 0))

(define (llenarVector100 vec cont)
  (cond ((<= cont 100)
         (llenarVector100 (vector-append vec (vector cont)) (add1 cont))
         )
        (else
         vec
         ))
  )

;(llenarVector100 vec3 1)
(define (ejercicio_11 vec_init iter vec_end)
  (if (< iter (vector-length vec_init))
      (begin
        (ejercicio_11 vec_init (add1 iter) (vector-append vec_end (vector (sqr (vector-ref vec_init iter)))))
        )
      (begin
        (displayln "Vector original: ")
        (mostrar vec_init 0)
        (newline)
        (displayln "Vector modificado: ")
        (mostrar vec_end 0)
        )
      )
  )

;(ejercicio_11 (llenarVector100 vec3 1) 0 (make-vector 0))

(define vec4 (make-vector 0))

(define (sumatoria vec iter acum)
  (if (< iter (vector-length vec))
      (begin
        (sumatoria vec (add1 iter) (+ acum (vector-ref vec iter)))
        )
      (begin
        acum
        )
      )
  )

(define (ejercicio_13 vec cont)
  (if (< cont 100)
      (begin
        (ejercicio_13 (vector-append vec (vector cont)) (+ cont 3))
        )
      (begin
        (display "La suma del vector es: ")
        (sumatoria vec 0 0)
        )
      )
  )

;(ejercicio_13 vec4 3)

(define (fibonacci n)
  (if (or (zero? n) (= n 1))
      (begin n)
      (begin
        (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
        )
      )
  )

(define (ejercicio_15 vec iter end)
  (if (< iter (add1 end))
      (begin
        (ejercicio_15 (vector-append vec (vector (fibonacci iter))) (add1 iter) end)
        )
      (begin
        (display "Este es su vector de fibonacci: ")
        (mostrar vec 0)
        )
      )
  )

;(ejercicio_15 (make-vector 0) 0 20)

