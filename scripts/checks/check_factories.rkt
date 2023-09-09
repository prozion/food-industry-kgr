#!/usr/bin/env racket

#lang racket

(require odysseus)
(require tabtree)
(require tabtree/utils)
(require tabtree/sorters)

(define (check-duplicated-ids tabtree)
  (let* (
        (duplicated-ids ($ duplicated-ids tabtree)))
    (for (((k v) duplicated-ids))
      (displayln (format "~a [~a]" k (implode v ", "))))))

(define (new-refs existed-refs-file refname)
  (let* ((existed-refs (->> existed-refs-file parse-tabtree hash-values (filter (λ (item) ($ __parent item))) (map id)))
        (factory-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories.tree"))
        (factory-cosmetics-tabtree (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories_cosmetics.tree"))
        (all-factories-tabtree (hash-union factory-tabtree factory-cosmetics-tabtree))
        (refs (->> all-factories-tabtree hash-values (map (λ (item) (hash-ref* item refname))) flatten remove-duplicates cleanmap)))
    (minus refs existed-refs)))

; remove this patch when back to Ozery!
(define (list->pretty-string lst (sep " "))
  (string-join (map ~a lst) sep))

(define new-products (new-refs "/home/denis/projects/food_industry_kgr/source/taxonomies/products.tree" "prod"))
(define new-companies (new-refs "/home/denis/projects/food_industry_kgr/source/facts/companies.tree" "company"))
(define new-trademarks (new-refs "/home/denis/projects/food_industry_kgr/source/facts/trademarks.tree" "tm"))

(define factories_tt (parse-tabtree "/home/denis/projects/food_industry_kgr/source/facts/factories.tree" #:parse-info #t))

(--- "Duplicated ids [lines]:")
(check-duplicated-ids factories_tt)

(--- "---------------------------------")
(--- "Uncategorized products:")
(--- (list->pretty-string new-products ", "))
(--- (format "Вcего: ~a" (length new-products)))

(--- "---------------------------------")
(--- "Undeclared companies:")
(--- (list->pretty-string new-companies ", "))
(--- (format "Вcего: ~a" (length new-companies)))

(--- "---------------------------------")
(--- "Undeclared trademarks:")
(--- (list->pretty-string new-trademarks ", "))
(--- (format "Вcего: ~a" (length new-trademarks)))
