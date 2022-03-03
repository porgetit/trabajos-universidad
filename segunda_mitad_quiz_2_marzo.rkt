#lang racket
(define (display->hora h m s)
  (display h)
  (display ":")
  (display m)
  (display ":")
  (display s)
  )
(define (horas->segundos h)
  (* 3600 h) ;esta función me develve las horas en segundos para poder operarlos más fácilmente
  )
(define (minutos->segundos m)
  (* 60 m) ;esta función me devuelve los minutos en segundos para poder operarlos más fácilmente
  )
(define (+segundos hs ms ss)
  (+ hs ms ss)
  )
(define (dif-tiempo t2 t1)
  (- t2 t1)
  )
(define (precio? tiempo dia)
  (if (or (eq? dia 'lunes) (eq? dia 'martes) (eq? dia 'miércoles) (eq? dia 'jueves) (eq? dia 'viernes))
      (begin
        (if (> tiempo (* 3 3600))
            (begin
              "$6.000"
              )
            (begin
              (if (not (= (floor (/ tiempo 3600)) (/ tiempo 3600))) ; si [floor(horas)] diferente [horas]
                  (begin
                    (+ 2000 (* (floor (/ tiempo 3600) 3600)))
                    )
                  (begin)
                  )
              )
            )
        )
      (begin
        (if (or (eq? dia 'sabado) (eq? dia 'domingo))
            (begin
              "Costo en fin de semana"
              )
            (begin
              "Por favor, escriba un día de la semana válido en español"
              )
            )
        )
      )
  )
(define (principal)
  (begin
    (display "Ingrese el día de la semana: ")
    (define dia (read))
    ; (define dia-non-string (read))
    ; (define dia (substring dia-non-string 0))
    ; (display dia)
    (display "Ingrese la hora de entrada (hh mm ss): ")
    (define h-entrada (read))
    (define m-entrada (read))
    (define s-entrada (read))
    (display "Ingrese la hora de salida (hh mm ss): ")
    (define h-salida (read))
    (define m-salida (read))
    (define s-salida (read))
    (define tiempo-entrada (+segundos (horas->segundos h-entrada) (minutos->segundos m-entrada) s-entrada))
    (define tiempo-salida (+segundos (horas->segundos h-salida) (minutos->segundos m-salida) s-salida))
    (define dif.tiempo (dif-tiempo tiempo-salida tiempo-entrada))
    ; (display tiempo-entrada)(newline)
    ; (display tiempo-salida)(newline)
    (display dif.tiempo)(newline)
    (display (precio? dif.tiempo dia))
    (newline)
    )
  )
(principal)

#|
    ; (display (string-append (number->string h-entrada) ":" (number->string m-entrada) ":" (number->string s-entrada)))
    ; (display (string-append h-salida ":" m-salida ":" s-salida))
    ; (display->hora h-entrada m-entrada s-entrada)(newline)
    (define hs (horas->segundos h-entrada))
    (define ms (minutos->segundos m-entrada))
    (define ss s-entrada)
    (display (+segundos hs ms ss))
    (newline)
    (newline)
|#

#|
    · Calcular el tiempo de uso del parqueadero
    · Calcular el costo neto del tiempo de uso del parqueadero
    · Evaluar el descuento según el día de la semana
    · Aplicar el descuento al costo neto del parqueadero para obtener el cobro final
|#