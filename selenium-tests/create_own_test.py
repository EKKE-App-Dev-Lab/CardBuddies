import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()

def test_create_own_card(browser):
    browser.get("http://localhost/cardbuddies/makeyourcard.php")

    browser.maximize_window()

    time.sleep(2)

    expected_title = "CardBuddies | KÉSZÍTS SAJÁT KÁRTYÁT"
    assert expected_title in browser.title, f"Expected title '{expected_title}' but got '{browser.title}'"

    service_subtitle = browser.find_element(By.XPATH, "//div[@class='subtitle']/h2").text
    assert service_subtitle == "KÜLÖNLEGES SZOLGÁLTATÁSUNK", f"Expected subtitle 'KÜLÖNLEGES SZOLGÁLTATÁSUNK' but got '{service_subtitle}'"

    offer_title = browser.find_element(By.XPATH, "//section[@class='offer-section']//h2").text
    assert offer_title == "AJÁNLATUNK", f"Expected offer title 'AJÁNLATUNK' but got '{offer_title}'"

    footer_phone = browser.find_element(By.XPATH, "//div[@class='contact-links']//span[@class='phone']").text
    expected_phone = "+36 36 123 XXXX"
    assert footer_phone == expected_phone, f"Expected phone '{expected_phone}' but got '{footer_phone}'"