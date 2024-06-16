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

    cards = browser.find_elements(By.CLASS_NAME, "featured__products")
    cards[0].click()

    time.sleep(2)

    kosarba = browser.find_element(By.ID, "add-to-cart-btn")
    kosarba.click()

    time.sleep(3)

    browser.get("http://localhost/cardbuddies/cart.php")

    print("Most expensive card added to cart and navigated to cart successfully.")

    time.sleep(2)

    browser.get("http://localhost/cardbuddies/checkout.php")

    time.sleep(2)

    browser.find_element(By.ID, "firstName").send_keys("John")
    browser.find_element(By.ID, "lastName").send_keys("Doe")
    browser.find_element(By.ID, "email").send_keys("john.doe@example.com")
    browser.find_element(By.ID, "address").send_keys("123 Main St")
    browser.find_element(By.ID, "country").send_keys("Magyarország")
    browser.find_element(By.ID, "state").send_keys("Budapest")
    browser.find_element(By.ID, "zip").send_keys("1111")
    browser.find_element(By.ID, "credit").click()
    browser.find_element(By.ID, "cc-name").send_keys("John Doe")
    browser.find_element(By.ID, "cc-number").send_keys("4111111111111111")
    browser.find_element(By.ID, "cc-expiration-mm").send_keys("12")
    browser.find_element(By.ID, "cc-expiration-yy").send_keys("2025")
    browser.find_element(By.ID, "cc-cvv").send_keys("123")