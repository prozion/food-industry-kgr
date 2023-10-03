#! /usr/bin/env Rscript

library(RSelenium)

getHTML = function(url) {
  dr = remoteDriver(browserName="phantomjs", port=3001L)
  dr$open(silent=TRUE)
  dr$navigate(url)
  # Sys.sleep(1)
  dr$getPageSource()
}

getHTML("http://example.org")


# (define sample
# #<<SAMPLE
# <div class="content-contact-item">
#   <div class="content-contact-item__tt">Веб-сайт</div>
#     <div class="content-contact-item__block">
#       <div class="field field-name-field-site field-type-link-field field-label-hidden">
#         <div class="field-items">
#           <div class="field-item even">
#             <a href="http://varnitsa.ru/?utm_source=fabricators&amp;utm_medium=free&amp;utm_campaign=callme" target="_blank" rel="nofollow">varnitsa.ru/</a>
#           </div>
#         </div>
#       </div>
#     </div>
# </div>
# SAMPLE
# )
#
# ; (--- (get-url "https://fabricators.ru/proizvoditel/varnica"))
# ; (--- (regexp-match* #px"(.а.).*? " "Так съешь же этих мягких французских булочек во Франции " #:match-select cadr))
# ; (--- (regexp-match* #px"<div.*?>Веб-сайт.*?<a href=.*?>(.*?)</a>" sample #:match-select cadr))
# ; (--- (regexp-match* #px".*<div.*?>Веб-сайт.*?<a href=.*?>(.*?)</a>.*" (get-url "https://fabricators.ru/proizvoditel/varnica") #:match-select cadr))
