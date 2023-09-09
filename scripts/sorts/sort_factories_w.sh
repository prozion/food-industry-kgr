#!/bin/bash

# sort by workers number
sort.rkt --by-f '(extend-numeric "w" max)' --pars-order "place,prod,w,w-future" --ignore-keys "a,alt,sid,abbr,name,former-id,tsid,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,raw,equipment,assets,repair,brand,url,vk,email,proving-ground,ip,ez,facilities-from,company,url" --dest /home/denis/projects/food_industry_kgr/source/facts/factories_w.tree /home/denis/projects/food_industry_kgr/source/facts/factories.tree
