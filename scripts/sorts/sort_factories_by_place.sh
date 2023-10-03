#!/bin/bash

# sort by place
sort.rkt --by-key "place" --pars-order "alt,name,former-id,tsid,sid,abbr,deabbr,place,hq,start,end,stop,acap,ocap,mcap,rev,oinc,pinc,raw,equipment,assets,repair,brand,media/vk,url,old-url,c/email,c/phone,ez,facilities-from,w,w-future,company,prod,tm,owns-tm" --ignore-keys "a" --dest /home/denis/projects/food_industry_kgr/source/facts/factories_place.tree /home/denis/projects/food_industry_kgr/source/facts/factories.tree
