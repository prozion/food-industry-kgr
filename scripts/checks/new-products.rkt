#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)

(define existed_products (->> "/home/denis/projects/food-industry-kgr/source/products.tree" parse-tabtree hash-values (filter (λ (item) ($ __parent item))) (map id)))
(define factory_products (->> "/home/denis/projects/food-industry-kgr/source/factories.tree" parse-tabtree hash-values (map (λ (item) ($ prod item))) flatten remove-duplicates cleanmap))

(--- "Uncategorized products:")
(---- (minus factory_products existed_products))
