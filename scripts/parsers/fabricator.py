#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

# patch
options = Options()
options.add_argument("--headless")
options.binary_location = "/usr/bin/google-chrome"

driver = webdriver.Chrome(options=options)
driver.get('https://www.example.com/')

body = driver.find_element('css selector', 'body')
print(body.get_attribute('innerHTML'))

driver.quit()
