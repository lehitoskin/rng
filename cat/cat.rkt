#!/usr/bin/env racket
#lang racket/base
(require racket/file
         racket/cmdline)
; cat.rkt
; RNG cat

(command-line
 #:args (file)
 (let [(lst (file->lines file))]
   (for-each displayln lst)))
