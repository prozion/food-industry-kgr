#!/bin/bash

tabtreefile=facts/places_russia.tree

~/libs/tabtree/tabtree/bin/check.rkt --option dupids ~/projects/food_industry_kgr/source/$tabtreefile
