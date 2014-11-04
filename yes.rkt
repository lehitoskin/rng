#!/usr/bin/env racket
#lang racket/base
; yes.rkt
; RNG yes
; prints out a string or strings until killed
; #\y is default
(require racket/cmdline)

(command-line
 #:args ([str null] . str2)
 (let loop ()
   (cond [(and (not (null? str)) (not (null? str2))) ; neither are null
          (displayln str)
          (apply displayln str2)
          (loop)]
         [(and (not (null? str)) (null? str2)) ; only one string supplied
          (displayln str)
          (loop)]
         [else (displayln #\y) (loop)]))) ; default, only display #\y
