#lang racket

;1. (cond-recursividad)

(define(factorial n)
  (cond
    ((= n 0)
     1)
    ((not(= n 0))
     (* n(factorial (- n 1))))))

;2

(define (potencia n m)
  (if (> m 1)
      (begin
        (* n (potencia n (- m 1)))
        )
      (begin
        n
        )
      )
  )

;3

;3. (secuencia)

(define(secuencias n m)
  (if(= n m)
     {begin(display n)(display "^")(display m)""}
     {begin
       (display n)(display "^")(displayln m)
       (secuencias n (+ m 1))}))

(define(secuencia)
  {begin
    (display "Calcular la secuencia de: ")
    (display(secuencias (read) 0))})

;4

(define (suma n m)
  (if (< n m)
      (begin
        (if (not (zero? n))
            (begin
              (suma (- n 1) (+ m 1))
              )
            (begin
              m
              )
            )
        )
      (begin
        (if (not (zero? m))
            (begin
              (suma (+ n 1) (- m 1))
              )
            (begin
              n
              )
            )
        )
      )
  )

;5. Multiplicar

(define(multiplicacion1 n m)
  (if(> n 1)
     {begin
       (+ m(multiplicacion1 (- n 1)m))}
     {begin m}))

(define(multiplicacion2 n m)
  (if(> m 1)
     {begin
       (+ n(multiplicacion2 n(- m 1)))}
     {begin n}))

(define(multiplicacion x y)
  {begin
    (if(> x y)
       (multiplicacion1 x y)
       (multiplicacion2 x y))})

;6

(define (fibonacciSerie n)
  (cond
    ((or (zero? n) (= n 1)) n)
    (else
     (+ (fibonacciSerie (- n 1)) (fibonacciSerie (- n 2)))
     )
    )
  )

;7. Sumar de 1 hasta N

(define(sumar n)
  (if(= n 1)
     {begin n}
     {begin
       (+ n(sumar (- n 1)))}))

;8

(define (divisionZ n m cociente)
  (if (>= n m)
      (begin
        (divisionZ (- n m) m (add1 cociente))
        )
      (begin
        cociente
        )
      )
  )

;9

(define(ciclo moneda)
  (if(= moneda 1)
     "Cara"
     "Cruz"))


(define(Juego)
  {begin
    (display "Cuánto desea apostar?")(display "\t")
    (define cantidad (read))
    (define moneda (random 2))
    (displayln(dobleOnada cantidad cantidad (random 2) 1 0))
    })
    

(define(dobleOnada cantidad cantidadbase moneda repetir lanzamientos)
  (if(not(= repetir 0))
     {begin
       (if(= moneda 1)
          {begin
            (display"La moneda cayó en: ")(displayln(ciclo moneda))
            (displayln (+ cantidad cantidadbase))(newline)
            (displayln "Para seguir jugando escriba 1\nSi desea terminar y ver su puntaje, escriba 0")
            (dobleOnada (+ cantidad cantidadbase) cantidadbase (random 2) (read) (+ lanzamientos 1))}
          {begin
            (display"La moneda cayó en: ")(displayln(ciclo moneda))
            (display "Actualemente tiene de dinero: ")(displayln (- cantidad cantidadbase))(newline)
            (displayln "Para seguir jugando escriba 1\nSi desea terminar y ver su puntaje, escriba 0")
            (dobleOnada (- cantidad cantidadbase) cantidadbase (random 2) (read) (+ lanzamientos 1))})}
     {begin
       (displayln "Resultado: ")
       (display "Número de jugadas: ")(displayln (- lanzamientos 1))
       (display "Total ganado: ")(display cantidad)""}
     ))

;10

(define (adivinar userInput number countFails)
  (if (= userInput number)
      (begin
        (display "¡Correcto!, el número es: ")(displayln number)
        (display "Le tomó ")(display (add1 countFails))(displayln " intentos para adivinarlo")
        )
      (begin
        (displayln "Lo siento, pruebe de nuevo")
        (adivinar (read) number (add1 countFails))
        )
      )
  )

;(adivinar (read) (random 1 11) 0)

;11

(define(contra contraseña posible intentos)
  (if(= intentos 0)
     {begin "Su cuenta ha sido bloqueada, número de intentos 3"}
     {begin
       (if(not(equal? contraseña posible))
          {begin
            (display "Lo siento, contraseña equivocada\nIntentos restantes: ")
            (displayln intentos)
            (contra contraseña (read) (- intentos 1))}
          {begin "Enhorabuena"})}))


(define(Contraseña)
  {begin
    (display "Cree una contraseña: ")
    (define contraseña (read))
    (display "Ingrese su contraseña: ")
    (define posible(read))
    (contra  contraseña posible 2)})

;12

(define (tabla10 n multiplicador)
  (if (< multiplicador 10)
      (begin
        (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
        (tabla10 n (add1 multiplicador))
        )
      (begin
        (display n)(display " * ")(display multiplicador)(display " = ")(displayln (* n multiplicador))
        )
      )
  )

;13

(define(positivosynegativos n positivos negativos)
  (if(number? n)
     {begin
       (if(positive? n)
          (positivosynegativos (read) (+ positivos 1) negativos)
          (positivosynegativos (read) positivos (+ negativos 1)))}
     {begin
       (displayln positivos)
       (displayln negativos)""}))
(define(lista)
  {begin
    (displayln "Ingrese los números de su lista, cuando termine escriba cualquier letra")
    (define n(read))
    (displayln(positivosynegativos n 0 0))})

;14

(define (sumaImpares n acumulador)
  (cond
    ((>= n 1)
     (if (odd? n)
         (sumaImpares (- n 1) (+ acumulador n))
         (sumaImpares (- n 1) acumulador)
         )
     )
    (else
     acumulador
     )
    )
  )

;15

(define(condicionn numero)
  (if(> numero 10000)
     (remainder numero 10000)
     (if(> numero 1000)
        (remainder numero 1000)
        (if(> numero 100)
           (remainder numero 100)
           (if(> numero 10)
              (remainder numero 10)
              (cond ((> numero 0)(/ numero 1))))))))


(define(paresenteros condicion n numero sumar)
  (if(integer? n)
     {begin
       (if(>= n numero)
          {begin
            (if(not(odd? numero))
               {begin
                 (if(=(condicionn numero)4)
                    {begin
                      (display numero)
                      (paresenteros condicion n (add1 numero)(+ sumar numero))}
                    {begin
                      (paresenteros condicion n(add1 numero)sumar)})}
               {begin
                 (paresenteros condicion n(add1 numero)sumar)})}
          {begin sumar})}
     {begin "No es entero"}))

;16

(define (p16 n num a1 a2 c1 c2)
  (cond
    ((> n 0)
     (begin
       (if (positive? num)
           (p16 (- n 1) (read) (+ a1 num) a2 (add1 c1) c2)
           (p16 (- n 1) (read) a1 (+ a2 num) c1 (add1 c2))
           )
       )
     )
    (else
     (displayln (/ a1 c1))
     (displayln (/ a2 c2))
     )
    )
  )

;(p16 (read) (read) 0 0 0 0)

;17

(define(condiciones2 numero)
  (if(integer? numero)
     {begin
       (if(and(and(=(remainder numero 2)0)(not(=(remainder numero 5)0)))(and(> numero 100)(< numero 10000)))
          {begin "Cumple"}
          {begin
            (displayln "No cumple, ingrese otro")
            (condiciones2 (read))})}
     {begin "No es entero"}))

;18

(define (p18 n a1 a2 c1 c2)
  (cond
    ((> n 0)
     (p18 (read) (+ a1 n) a2 (add1 c1) c2)
     )
    ((< n 0)
     (p18 (read) a1 (+ a2 n) c1 (add1 c2))
     )
    (else
     (displayln (/ a1 c1))
     (display (/ a2 c2))
     )
    )
  )

;(p18 (read) 0 0 0 0)

;19

(define(conjunto n mayor menor)
  (if(not(number? n))
     {begin
       (display "El mayor y menor de la lista son: ")
       (displayln mayor)
       (displayln menor)}
     {begin
       (cond ((> n mayor){begin(conjunto (read) n menor)}))
       (cond ((< n menor) (conjunto (read) mayor n))
             (else (conjunto (read) mayor menor))
             )}))

(define(conjuntos)
  {begin
    (display "Ingrese el primer valor: ")
    (define n (read))
    (display "Ingrese los números de la lista, cuando termine ingrese cualquier letra: ")
    (conjunto n n n)
    })



     



(define(menupares op)
  (cond
    ((= op 1)"Calcular factorial de un número"(factorial(read)))
    ((= op 3)"Secuencia de un número basado en la potencia"(secuencia))
    ((= op 5)"Multiplicar sin *"(multiplicacion(read)(read)))
    ((= op 7)"Sumar de 1 hasta N"(sumar(read)))
    ((= op 9)"Doble o nada"(Juego))
    ((= op 11)"Intentos de contraseña"(Contraseña))
    ((= op 13)"Determinar positivos y negativos"(lista))
    ((= op 15)"Pares enteros que terminan en 4 de 1 a N"(paresenteros 4 (read) 1 0))
    ((= op 17)"Número con condiciones"(condiciones2 (read)))
    ((= op 19)"Calcular máximo y mínimo de un conjunto"(conjuntos))))

"Ingrese un número impar para ver el ejercicio"
(menupares (read))

;20

(define (m n)
   (floor(/(remainder n 10000)1000))
  )
(define (c n)
  (floor(/(remainder n 1000)100)
  ))
(define (d n)
  (floor(/(remainder n 100)10))
  )
(define (u n)
  (floor (/(remainder n 10)1))
  )
(define (sumacifras n)
  (+(+(+ (u n)(d n))(c n))(m n))
  )

(define (principal20)
  (displayln "Ingresar un numero de max 4 cibras:")
  (define n (read))
  (displayln "--------------------------------")
  (display "Unidades:")(displayln (u n))
  (display "Decenas:")(displayln (d n))
  (display "Centenas:")(displayln (c n))
  (display "Unidades de Mil:")(displayln (m n))
  (display "La suma total es:")(sumacifras n)
  )
(principal20)

#|
En la elaboración del presente taller, colaboramos Sofía Jaramillo Agudelo y
Kevin Esguerra Cardona. Sofía realizó los ejercicios con índice impar y
Kevin realizó los ejercicios con índice par.

Nota: El ejercicio 20 fue hecho en colaboración con el compañero de clase: Jeronimo Riveros
|#