import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()


def test_about_us_page(browser):
    browser.get("http://localhost/cardbuddies/about.php")

    browser.maximize_window()

    time.sleep(2)

    expected_title = "CardBuddies | RÓLUNK"
    assert expected_title in browser.title, f"Expected title '{expected_title}' but got '{browser.title}'"

    rolunk_subtitle = browser.find_element(By.CLASS_NAME, "about-us-subtitle").text
    assert rolunk_subtitle == "RÓLUNK", f"Expected subtitle 'RÓLUNK' but got '{rolunk_subtitle}'"

    mesterunk_title = browser.find_element(By.CLASS_NAME, "baker-info-title").text
    assert mesterunk_title == "Mesterünk", f"Expected title 'Mesterünk' but got '{mesterunk_title}'"

    master_name = browser.find_element(By.CLASS_NAME, "baker-name").text
    assert master_name == "KÖLES KATA", f"Expected name 'KÖLES KATA' but got '{master_name}'"

    master_position = browser.find_element(By.CLASS_NAME, "baker-position").text
    assert master_position == "CEO - CARDBUDDIES Kártyabolt", f"Expected position 'CEO - CARDBUDDIES Kártyabolt' but got '{master_position}'"