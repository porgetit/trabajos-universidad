#lang racket
;long_bajada
(define (long-bajada altura)
  (* (floor (/ altura 20)) 5) ; en cm
  )
;long_subida
(define (long-subida altura l-bajada)
  (+ altura l-bajada)
  )
;t_subida
(define (t-subida l-subida)
  (* 3 l-subida)
  )
;t_bajada
(define (t-bajada l-bajada)
  (* 1 l-bajada)
  )
;t_total
(define (t-total t_bajada t_subida)
  (+ t_bajada t_subida)
  )

(define (principal-17)
  (begin
    (display "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n")
    (display "\t\tGusanito\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\nIngrese la altura de escalada deseada en centímetros: ")
    (define altura (read))
    (define l_bajada (long-bajada altura))
    (define l_subida (long-subida altura l_bajada))
    (define t_subida (t-subida l_subida))
    (define t_bajada (t-bajada l_bajada))
    (display "El tiempo ocupado para subir, en segundos, es: ")
    (t-total t_bajada t_subida)
    )
  )
(principal-17) ;(22) -> 86
