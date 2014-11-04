#!/usr/bin/env racket
#lang racket/base
; grep.rkt
; RNG grep
(require racket/file
         racket/cmdline)

(command-line
 #:args (re file)
 (for ([(line-text line-num) (in-indexed (file->lines file))])
   (when (regexp-match? (pregexp re) line-text)
     (printf "~a:~a ~a\n" file line-num line-text))))
