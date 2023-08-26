#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)

(define existed_products (->> "/home/denis/projects/food_industry_kgr/source/facts/products.tree" parse-tabtree hash-values (filter (λ (item) ($ __parent item))) (map id)))
(define factory_products (->> "/home/denis/projects/food_industry_kgr/source/facts/factories.tree" parse-tabtree hash-values (map (λ (item) ($ prod item))) flatten remove-duplicates cleanmap))
(define factory_cosmetics_products (->> "/home/denis/projects/food_industry_kgr/source/facts/factories_cosmetics.tree" parse-tabtree hash-values (map (λ (item) ($ prod item))) flatten remove-duplicates cleanmap))

(define result (minus
        (join factory_products factory_cosmetics_products)
        existed_products))

(--- "Uncategorized products:")
(---- result)
(--- (format "Вcего: ~a" (length result)))
