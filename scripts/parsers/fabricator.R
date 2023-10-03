#! /usr/bin/env Rscript

library(wdman)
library(RSelenium)

cl <- chrome(port=3005L, version="117.0.5938.132", verbose=FALSE)
driver <- remoteDriver(
      browserName="chrome",
      extraCapabilities = list(chromeOptions = list(args = list('--headless'))),
      port = 3005L
    )
driver$open(silent=TRUE)

# init = function() {
#   cl <- chrome(port=3005L, version="117.0.5938.132", verbose=FALSE)
#   driver <- remoteDriver(
#         browserName="chrome",
#         extraCapabilities = list(chromeOptions = list(args = list('--headless'))),
#         port = 3005L
#       )
#   driver$open(silent=TRUE)
#   return(driver)
# }

getHTML = function(driver, url) {
  # Sys.sleep(1)
  driver$navigate(url)
  # driver$getTitle()
  element <- driver$findElement(using = "xpath", "//div[@class='title-site--h2'][text()='Контакты']/following-sibling::div//div[text()='Веб-сайт']/following-sibling::div")
  element$getElementText()
}

appendTabtreeLine = function(id, place = "", email = "", phone = "", url = "", w = "") {
  fp <- file("test_new_factories.tree", open = "a")
  place = ifelse(place == "", "", sprintf(" place:\"%s\"", place))
  phone = ifelse(phone == "", "", sprintf(" phone:\"%s\"", phone))
  email = ifelse(email == "", "", sprintf(" email:%s", email))
  url = ifelse(url == "", "", sprintf(" url:%s", url))
  w = ifelse(w == "", "", sprintf(" w:%s", w))
  id = sprintf("\"%s\"", id)
  res <- paste0(id, place, phone, email, url, w)
  writeLines(res, fp)
  close(fp)
}

# v <- getHTML(driver, "https://fabricators.ru/proizvoditel/ipatovskiy-pivovarennyy-zavod-ipz")
# print(v)

appendTabtreeLine("Алейский сахарный завод", place = "Алейск", url = "altaysahar.ru")
