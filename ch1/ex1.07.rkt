#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (square x)
    (* x x))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
            x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(displayln "Use good-enough? in textbook : ")
(display "  0.100 -> ")
(displayln (sqrt (square 0.1)))
(display "  0.050 -> ")
(displayln (sqrt (square 0.05)))
(display "  0.010 -> ")
(displayln (sqrt (square 0.01)))
(display "  0.005 -> ")
(displayln (sqrt (square 0.005)))
(display "  0.001 -> ")
(displayln (sqrt (square 0.001)))
(display "  0.0001-> ")
(displayln (sqrt (square 0.0001)))

; will loop forever
; (sqrt (square 1e300))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (ENOUGH? s1 s2)
    (< (/ (abs(- s1 s2)) s1) 0.001))

(define (SQRT-ITER s1 s2 x)
    (if (ENOUGH? s1 s2)
        s2
        (SQRT-ITER s2 (improve s2 x) x)))

(define (SQRT x)
    (SQRT-ITER x 1.0 x))

(displayln "Use new Enough :")
(display "  0.100 -> ")
(displayln (SQRT (square 0.1)))
(display "  0.050 -> ")
(displayln (SQRT (square 0.05)))
(display "  0.010 -> ")
(displayln (SQRT (square 0.01)))
(display "  0.005 -> ")
(displayln (SQRT (square 0.005)))
(display "  0.001 -> ")
(displayln (SQRT (square 0.001)))
(display "  0.0001-> ")
(displayln (SQRT (square 0.0001)))

(display "  1e150 -> ")
(displayln (SQRT (square 1e150)))