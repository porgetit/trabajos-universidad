#lang racket

(define-struct estudiante (code nombre edad))

;(define reg1 (estudiante 1004699587 "kevin" 21)) ;definir registro
;(displayln (estudiante-codigo reg1)) ;mostrar codigo
;(displayln (estudiante-nombre reg1)) ;mostrar nombre
;(displayln (estudiante-edad reg1)) ;mostrar edad

(define (llenar vec iter)
  (cond
    ((< iter (vector-length vec))
      (begin
        (display "Ingrese el código del estudiante n°")(displayln (add1 iter))
        (define code (read))
        (display "Ingrese el nombre del estudiante n°")(displayln (add1 iter))
        (define nombre (read))
        (display "Ingrese el edad del estudiante n°")(displayln (add1 iter))
        (define edad (read))
        (vector-set! vec iter (estudiante code nombre edad))
        (llenar vec (add1 iter))
        ))
      )
  )

(define (menor->mayor vec iter)
  (cond
    ((< iter (sub1 (vector-length vec)))
      (begin
        (define i (vector-ref vec iter))
        (define j (vector-ref vec (add1 iter)))
        (cond ((> (estudiante-edad i) (estudiante-edad j))
               (begin
                 ;si la edad de i es mayor que la de j estonces hacemos twist
                 (vector-set! vec iter j)
                 (vector-set! vec (add1 iter) i)
                 (menor->mayor vec 0)
                 )
               )
              (else
               (menor->mayor vec (add1 iter))
               ))
        ))
    (else
     (begin
        (mostrar vec 0 0)
        )
     )
    )
  )

(define (cambiarEdad vec iter code)
  ;(displayln code)
  (if (< iter (vector-length vec))
      (begin
        (cond ((equal? code (estudiante-code (vector-ref vec iter)))
               (begin
                 (displayln "¿Nueva edad?")
                 (define edad (read))
                 (define code (estudiante-code (vector-ref vec iter)))
                 (define nombre (estudiante-nombre (vector-ref vec iter)))
                 (vector-set! vec iter (estudiante code nombre edad))
                 (mostrar vec 0 0)
                 )
               )
              (else
               (cambiarEdad vec (add1 iter) code)
               ))
        )
      (begin
        (displayln "No hay, no eziste!")
        )
      )
  )

(define (mostrarbyCode vec iter code)
  ;(displayln code)
  (if (< iter (vector-length vec))
      (begin
        (cond ((equal? code (estudiante-code (vector-ref vec iter)))
               (begin
                 (printf "Estudiante ~a:\n\tCódigo:~a\n\tNombre:~a\n\tEdad:~a\n"
                   (add1 iter)
                   (estudiante-code (vector-ref vec iter))
                   (estudiante-nombre (vector-ref vec iter))
                   (estudiante-edad (vector-ref vec iter))
                   )
                 )
               )
              (else
               (mostrarbyCode vec (add1 iter) code)
               ))
        )
      (begin
        (displayln "No hay, no eziste!")
        )
      )
  )

(define (mayores->prom vec iter edad)
  (cond
    ((< iter (vector-length vec))
     (begin
       (cond ((>= (estudiante-edad (vector-ref vec iter)) edad)
              (begin
                (printf "Estudiante ~a:\n\tCódigo:~a\n\tNombre:~a\n\tEdad:~a\n"
                        (add1 iter)
                        (estudiante-code (vector-ref vec iter))
                        (estudiante-nombre (vector-ref vec iter))
                        (estudiante-edad (vector-ref vec iter))
                        )
                (mayores->prom vec (add1 iter) edad)
                )
              )
             (else
              (mayores->prom vec (add1 iter) edad)
              ))
       ))
    ))

(define (prom vec iter acum)
  (if (< iter (vector-length vec))
      (begin
        (prom vec (add1 iter) (+ acum (estudiante-edad (vector-ref vec iter))))
        )
      (begin
        (/ acum (vector-length vec))
        )
      )
  )

(define (mostrar vec iter opt)
  (cond
    ((zero? opt)
     (cond
       ((< iter (vector-length vec))
        (begin
          (printf "Estudiante ~a:\n\tCódigo:~a\n\tNombre:~a\n\tEdad:~a\n"
                  (add1 iter)
                  (estudiante-code (vector-ref vec iter))
                  (estudiante-nombre (vector-ref vec iter))
                  (estudiante-edad (vector-ref vec iter))
                  )
          (mostrar vec (add1 iter) opt)
          ))
       )
     )
    ((= opt 1)
     (begin
       (displayln "¿Código?")
       (define code (read))
       (mostrarbyCode vec 0 code)
       )
     )
    ((= opt 2)
     (begin
       (cond
         ((< iter (vector-length vec))
           (begin
             (cond ((>= (estudiante-edad (vector-ref vec iter)) 18)
                    (begin
                      (printf "Estudiante ~a:\n\tCódigo:~a\n\tNombre:~a\n\tEdad:~a\n"
                              (add1 iter)
                              (estudiante-code (vector-ref vec iter))
                              (estudiante-nombre (vector-ref vec iter))
                              (estudiante-edad (vector-ref vec iter))
                              )
                      (mostrar vec (add1 iter) opt)
                      )
                    )
                   (else
                    (mostrar vec (add1 iter) opt)
                    ))
             ))
           )
       )
     )
    ((= opt 3)
     (begin
         (displayln "¿Código?")
         (define code (read))
         (cambiarEdad vec iter code)
         )
     )
    ((= opt 4)
     (begin
       (menor->mayor vec 0)
       )
     )
    ((= opt 5)
     (begin
       (define edad (prom vec 0 0))
       (display "Edad promedio: ")
       (displayln edad)
       (mayores->prom vec iter edad)
       )
     )
    (else
     (displayln "Error (mostrar): {Opt} unknown option")
     )
    )
  )

(define (main)
  (begin
    (displayln "Ingrese la cantidad de registros deseada: ")
    (define vector-estudiantes (make-vector (read) void))
    (llenar vector-estudiantes 0)
    (displayln "Tabla de estudiantes llena, ¿Cómo desea listarlos?")
    (displayln "Lista completa [0]\t\tFiltrar por código [1]")
    (displayln "Filtrar mayores de edad [2]\tCambiar nombre [3]")
    (displayln "Ordenar de menor a mayor [4]\tPromedio de edad y mayores al promedio [5]")
    (define opt (read))
    (cond
      ((zero? opt)
       (mostrar vector-estudiantes 0 0)
       )
      ((= opt 1)
       (mostrar vector-estudiantes 0 1)
       )
      ((= opt 2)
       (mostrar vector-estudiantes 0 2)
       )
      ((= opt 3)
       (mostrar vector-estudiantes 0 3)
       )
      ((= opt 4)
       (mostrar vector-estudiantes 0 4)
       )
      ((= opt 5)
       (mostrar vector-estudiantes 0 5)
       )
      (else
       (displayln "Opción desconocida")
       )
      )
    )
  )

(main)