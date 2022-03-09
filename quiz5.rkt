#lang racket
;programa 1
#|
    El programa debe mostrar la factura con:
    -> El número camisas vendidas --
    -> El número de pantalones vendidos --
    -> El valor bruto de la venta de camisas --
    -> El valor bruto de la venta de pantalones --
    -> El valor bruto de la compra total --
    -> El valor del descuento --
    -> El valor neto de la compra --
    -> El monto del IVA (16% sobre el valor neto) --
    -> El valor a pagar

    {
        Los descuentos son:
        (compras < 70.000 [0%])
        (compras >= 70.000 y compras <= 150.000 [6%])
        (compras > 150.000 [12%])
    }
|#
(define (linea-horizontal)
  (display (make-string 46 #\-))(newline)
  )
(define (valor-bruto-camisas cantidad-camisas P1)
  (* cantidad-camisas P1)
  )
(define (valor-bruto-pantalones cantidad-pantalones P2)
  (* cantidad-pantalones P2)
  )
(define (valor-bruto valor-bruto-camisas valor-bruto-pantalones)
  (+ valor-bruto-camisas valor-bruto-pantalones)
  )
(define (descuento valor-bruto)
  (if (< valor-bruto 70000)
      (begin
        0
        )
      (if (and (>= valor-bruto 70000) (<= valor-bruto 150000))
          (begin
            0.06
            )
          (begin
            0.12
            )
          )
      )
  )
(define (valor-descuento valor-bruto descuento)
  (* valor-bruto descuento)
  )
(define (valor-neto valor-bruto valor-descuento)
  (- valor-bruto valor-descuento)
  )
(define (IVA valor-neto)
  (* valor-neto 0.16)
  )
(define (neto+IVA valor-neto IVA)
  (+ valor-neto IVA)
  )
(define (principal-1)
  (begin
    (define P1 10000)
    (define P2 20000)
    (linea-horizontal)
    (display "Ingrese la cantidad de camisas compradas: ")
    (define cantidad-camisas (read))
    (display "Ingrese la cantidad de pantalones comprados: ")
    (define cantidad-pantalones (read))
    (linea-horizontal)
    (display "FACTURA DE COMPRA\nCamisas: ")
    (display cantidad-camisas)
    (display "\nPantalones: ")
    (display cantidad-pantalones)
    (newline)
    (linea-horizontal)
    (display "Valor bruto de compra camisas: $")
    (display (valor-bruto-camisas cantidad-camisas P1))
    (display "\nValor bruto de compra pantalones: $")
    (display (valor-bruto-pantalones cantidad-pantalones P2))
    (display "\nValor bruto Total: $")
    (display (valor-bruto (valor-bruto-camisas cantidad-camisas P1) (valor-bruto-pantalones cantidad-pantalones P2)))
    (newline)
    (linea-horizontal)
    (define bruto (valor-bruto (valor-bruto-camisas cantidad-camisas P1) (valor-bruto-pantalones cantidad-pantalones P2)))
    (display "El valor del descuento es: $")
    (display (valor-descuento bruto (descuento bruto)))
    (newline)
    (linea-horizontal)
    (define rebaja (valor-descuento bruto (descuento bruto)))
    (display "El valor neto de la compra es: $")
    (display (valor-neto bruto rebaja))
    (newline)
    (linea-horizontal)
    (define neto (valor-neto bruto rebaja))
    (display "El monto del IVA (16%) es: $")
    (display (IVA neto))
    (newline)
    (linea-horizontal)
    (display "El valor a pagar es: $")
    (display (neto+IVA neto (IVA neto)))
    (newline)
    (linea-horizontal)
    )
  )

; (principal-1)
;
;
;
;
;
(define (area largo ancho)
  (* largo ancho)
  )
(define (descuento-terreno area)
  (if (and (> area 400) (<= area 500))
      (begin
        0.1
        )
      (begin
        (if (and (> area 500) (<= area 1000))
            (begin
              0.17
              )
            (begin
              (if (> area 1000) 0.25 0)
              )
            )
        )
      )
  )
(define (precio-terreno area valor-metro-cuadrado descuento)
  (- (* area valor-metro-cuadrado) (* (* area valor-metro-cuadrado) descuento))
  )
(define (principal-2)
  (begin
    (define valor-metro-cuadrado 10)
    (display "Ingrese el largo del terreno: ")
    (define largo (read))
    (display "Ingrese el ancho del terreno: ")
    (define ancho (read))
    (display "El precio del terreno es: $")
    (display (precio-terreno (area largo ancho) valor-metro-cuadrado (descuento-terreno (area largo ancho))))
    (newline)
    )
  )
; (principal-2)
;
;
;
;
;
; (define (tiempo-parqueo hora-salida hora-entrada))
(define (diferencia-segundos segundos-salida segundos-entrada)
  (if (> segundos-salida segundos-entrada)
      (begin
        (- segundos-salida segundos-entrada)
        )
      (begin
        (- (+ 60 segundos-salida) segundos-entrada)
        )
      )
  )
(define (principal-3)
  (begin
    (display "Ingrese el día de la semana: ")
    (define dia (read))
    (display "Ingrese la hora de entrada (hh mm ss): ")
    (define hora-entrada (read))
    (define minutos-entrada (read))
    (define segundos-entrada (read))
    (display "Ingrese la hora de salida (hh mm ss): ")
    (define hora-salida (read))
    (define minutos-salida (read))
    (define segundos-salida (read))
    (diferencia-segundos segundos-salida segundos-entrada)
    )
  )
