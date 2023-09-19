#!/bin/bash

# sort by workers number
sort.rkt --by-f '(extend-numeric "w" max)' --pars-order "place,w,w-future" --ignore-keys "alt,name,former-id,tsid,sid,abbr,deabbr,place,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,raw,equipment,assets,repair,brand,media/vk,url,old-url,c/email,c/phone,ez,facilities-from,w,w-future,company,prod,tm,owns-tm" --dest /home/denis/projects/food_industry_kgr/source/facts/factories_w.tree /home/denis/projects/food_industry_kgr/source/facts/factories.tree
