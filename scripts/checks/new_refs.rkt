#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)

(define (new-refs existed-refs-file refname)
  (let* ((existed-refs (->> existed-refs-file parse-tabtree hash-values (filter (λ (item) ($ __parent item))) (map id)))
        (factory-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories.tree"))
        (factory-cosmetics-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories_cosmetics.tree"))
        (all-factories-tabtree (hash-union factory-tabtree factory-cosmetics-tabtree))
        (refs (->> all-factories-tabtree hash-values (map (λ (item) (hash-ref* item refname))) flatten remove-duplicates cleanmap)))
    (minus refs existed-refs)))

(define new-products (new-refs "/home/denis/projects/food_industry_kgr/source/facts/products.tree" "prod"))
(define new-companies (new-refs "/home/denis/projects/food_industry_kgr/source/facts/companies.tree" "company"))
(define new-brands (new-refs "/home/denis/projects/food_industry_kgr/source/facts/brands.tree" "brand"))

(--- "Uncategorized products:")
(--- (list->pretty-string new-products ", "))
(--- (format "Вcего: ~a" (length new-products)))
(--- "Undeclared companies:")
(--- (list->pretty-string new-companies))
(--- (format "Вcего: ~a" (length new-companies)))
; (--- "Undeclared brands:")
; (--- new-brands)
; (--- (format "Вcего: ~a" (length new-brands)))
