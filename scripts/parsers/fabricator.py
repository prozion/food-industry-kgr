#!/usr/bin/env python3

import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

def init():
    # patch
    options = Options()
    options.add_argument("--headless")
    options.binary_location = "/usr/bin/google-chrome"
    driver = webdriver.Chrome(options=options)
    return driver

# //div[@class='title-site--h2'][text()='Контакты']/following-sibling::div//div[text()='Веб-сайт']/following-sibling::div
def get_parameter_by_xpath(driver, section, title, href=False):
    plain_text_xpath = "//div[@class='title-site--h2'][text()='%s']/following-sibling::div//div[text()='%s']/following-sibling::div" % (section, title)
    href_text_xpath = "//div[@class='title-site--h2'][text()='%s']/following-sibling::div//div[text()='%s']/following-sibling::div//a" % (section, title)
    xpath = href_text_xpath if href else plain_text_xpath
    try:
        element = driver.find_element(By.XPATH, xpath)
        result = element.text
    except NoSuchElementException:
        result = ""
    return result


def get_company_info(driver, url):
    time.sleep(0.2)
    driver.get(url)
    name = driver.title
    company = get_parameter_by_xpath(driver, 'Реквизиты', 'Название юр лица')
    place = get_parameter_by_xpath(driver, 'Контакты', 'Населенный пункт', True)
    phone = get_parameter_by_xpath(driver, 'Контакты', 'Телефон', True)
    email = get_parameter_by_xpath(driver, 'Контакты', 'Электронная почта', True)
    url = get_parameter_by_xpath(driver, 'Контакты', 'Веб-сайт', True)
    w = get_parameter_by_xpath(driver, 'Реквизиты', 'Количество сотрудников')
    return {"name": name, "company": company, "place": place, "w": w, "phone": phone, "email": email, "url": url}

driver = init()

urls = ("https://fabricators.ru/proizvoditel/ipatovskiy-pivovarennyy-zavod-ipz",
        "https://fabricators.ru/proizvoditel/saranskiy-pivovarennyy-zavod-spz",
        "https://fabricators.ru/proizvoditel/varnica")

for url in urls:
    company = get_company_info(driver, url)
    print("\"%s\" company:\"%s\" place:\"%s\" phone:\"%s\" email:%s url:%s w:%s" % (company["name"], company["company"], company["place"], company["phone"], company["email"], company["url"], company["w"]))

driver.quit()
