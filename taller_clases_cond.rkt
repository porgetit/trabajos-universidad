#lang racket
; (define (mayor x y)
;   (cond
;     ((> x y) x)
;     ((> y x) y)
;     (else 'Iguales)
;     )
;   )
; (mayor (read) (read))

; (define (menor x y z)
;   (cond
;     ((< x y)
;      (cond
;        ((< x z) x)
;        ((< z x) z)
;        )
;      )
;     ((< y x)
;      (cond
;        ((< y z) y)
;        ((< z y) z)
;        )
;      )
;     ((< z x)
;      (cond
;        ((< z y) z)
;        ((< y z) y)
;        )
;      )
;     (else "Son iguales")
;     )
;   )
; (menor (read) (read) (read))

; (define (mayor w x y z)
;   (cond
;     ((and (> w x) (> w y) (> w z)) w)
;     ((and (> x w) (> x y) (> x z)) x)
;     ((and (> y w) (> y x) (> y z)) y)
;     ((and (> z w) (> z x) (> z y)) z)
;     (else "No hay un mayor")
;     )
;   )
; (mayor (read) (read) (read) (read))

; (define (calculadora operacion a b)
;   (cond
;     ((eq? operacion 'sumar) (+ a b))
;     ((eq? operacion 'restar) (- a b))
;     ((eq? operacion 'multiplicar) (* a b))
;     ((eq? operacion 'abs)
;      (cond
;        ((>= a 0) a)
;        (else (* -1 a))
;        )
;      )
;     (else "Operación desconocida")
;     )
;   )
; (calculadora (read) (read) (read))

; (define (calculadora operacion a b)
;   (cond
;     ((= operacion 1) (+ a b))
;     ((= operacion 2) (- a b))
;     ((= operacion 3) (* a b))
;     ((= operacion 4)
;      (cond
;        ((>= a 0) a)
;        (else (* -1 a))
;        )
;      )
;     (else "Operación desconocida")
;     )
;   )
; (calculadora (read) (read) (read))

; (define (utilidad años)
;   (cond
;     ((< años 1) "5%")
;     ((< años 2) "7%")
;     ((< años 5) "10%")
;     ((< años 10) "15%")
;     (else "20%")
;     )
;   )
; (utilidad (read))
