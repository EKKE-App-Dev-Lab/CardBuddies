import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()


def test_ordering(browser):
    browser.get("http://localhost/cardbuddies/login.php")

    browser.maximize_window()

    time.sleep(2)

    username_input = browser.find_element(By.NAME, "uname")
    username_input.send_keys("hello")

    password_input = browser.find_element(By.NAME, "password")
    password_input.send_keys("Hello11!")

    login_button = browser.find_element(By.XPATH, "//button[text()='bejelentkezés']")
    login_button.click()

    time.sleep(3)

    browser.get("http://localhost/cardbuddies/products.php")
    time.sleep(2)

    sort_button = browser.find_element(By.XPATH, "//button[contains(text(),'Rendezés')]")
    sort_button.click()

    # Dropdown betöltsön
    time.sleep(1)

    # Select "Ár szerint csökkenő"
    ascending_sort = browser.find_element(By.XPATH, "//a[contains(text(),'Ár szerint csökkenő')]")
    ascending_sort.click()

    time.sleep(1)
