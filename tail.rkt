#!/usr/bin/env racket
#lang racket/base
; tail.rkt
; RNG tail
(require racket/file
         racket/cmdline)

; default number of lines to print is 10
(define num-lines (make-parameter 10))

(command-line
 #:once-any
 [("-n" "--lines") N ; -n takes one argument N
                   "Output the last N lines, instead of the last 10."
                   (num-lines (string->number N))]
 #:args (file . others)
 (letrec ([lst-file (file->lines file)]
          [lst-other (map file->lines others)]
          [loop-file (λ (lst len times)
                       (cond [(or (null? lst) (zero? times)) (void)]
                             [else
                              (displayln (list-ref lst (- len times)))
                              (loop-file (cdr lst) (sub1 len) (sub1 times))]))]
          [loop-other (λ (lst len)
                        ; loop through to get all the files
                        (cond [(null? lst) (void)]
                              ; inner loop to get the lines of the file we're currently on
                              [else (let loop ([current-lst (car lst)]
                                               [current-len len]
                                               [times (num-lines)])
                                      (cond [(or (null? current-lst) (zero? times)) (void)]
                                            [else
                                             (displayln (list-ref current-lst
                                                                  (- current-len times)))
                                             (loop (cdr current-lst)
                                                   (- current-len 1)
                                                   (- times 1))]))
                                    (unless (null? (cdr lst))
                                      (loop-other (cdr lst) (length (car (cdr lst)))))]))])
   (loop-file lst-file (length lst-file) (num-lines))
   (unless (null? lst-other)
     (loop-other lst-other (length (car lst-other))))))
