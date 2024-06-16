import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()


def test_login(browser):
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

    phone_input = browser.find_element(By.NAME, "phone")
    phone_input.clear()
    phone_input.send_keys("0630 1234567")

    time.sleep(1)
    update_button = browser.find_element(By.NAME, "updateProfile")
    browser.execute_script("arguments[0].scrollIntoView(true);", update_button)
    time.sleep(3)
    update_button.click()

    validation_errors = browser.find_elements(By.CLASS_NAME, "input-error")
    validation_error = ""
    for error in validation_errors:
        if error.text != "" and validation_error == "":
            validation_error += error.text
    expected_error_message = "Kérem, adjon meg egy érvényes telefonszámot szóközök nélkül, például: 06201234567!"
    assert validation_error == expected_error_message, f"Expected validation error '{expected_error_message}' but got '{validation_error}'"

    time.sleep(2)

    address_input = browser.find_element(By.NAME, "address")
    address_input.clear()
    address_input.send_keys("New Address 999")

    phone_input = browser.find_element(By.NAME, "phone")
    phone_input.clear()
    phone_input.send_keys("063099999999")

    time.sleep(1)
    update_button = browser.find_element(By.NAME, "updateProfile")
    browser.execute_script("arguments[0].scrollIntoView(true);", update_button)
    time.sleep(3)
    update_button.click()

    time.sleep(2)

    updated_address = browser.find_element(By.NAME, "address").get_attribute("value")
    updated_phone = browser.find_element(By.NAME, "phone").get_attribute("value")

    assert updated_address == "New Address 999", f"Expected address 'New Address 123' but got '{updated_address}'"
    assert updated_phone == "063099999999", f"Expected phone '+36 30 123 4567' but got '{updated_phone}'"

    address_input = browser.find_element(By.NAME, "address")
    address_input.clear()
    address_input.send_keys("New Address 123")

    phone_input = browser.find_element(By.NAME, "phone")
    phone_input.clear()
    phone_input.send_keys("06301234567")

    time.sleep(1)
    update_button = browser.find_element(By.NAME, "updateProfile")
    browser.execute_script("arguments[0].scrollIntoView(true);", update_button)
    time.sleep(3)
    update_button.click()

    time.sleep(2)

    updated_address = browser.find_element(By.NAME, "address").get_attribute("value")
    updated_phone = browser.find_element(By.NAME, "phone").get_attribute("value")

    assert updated_address == "New Address 123", f"Expected address 'New Address 123' but got '{updated_address}'"
    assert updated_phone == "06301234567", f"Expected phone '+36 30 123 4567' but got '{updated_phone}'"

    # Log out
    logout_button = browser.find_element(By.XPATH, "//span[@class='user-logout']/a/button")
    browser.execute_script("arguments[0].scrollIntoView(true);", logout_button)
    logout_button.click()

    time.sleep(2)

    assert 'CardBuddies' in browser.title

