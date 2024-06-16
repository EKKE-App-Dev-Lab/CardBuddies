import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()


def test_product_order_by_price(browser):
    browser.get('http://localhost/cardbuddies/products.php')
    browser.maximize_window()

    time.sleep(2)

    sort_button = browser.find_element(By.XPATH, "//button[contains(text(),'Rendezés')]")
    sort_button.click()

    # Dropdown betöltsön
    time.sleep(1)

    # Select "Ár szerint növekvő"
    ascending_sort = browser.find_element(By.XPATH, "//a[contains(text(),'Ár szerint növekvő')]")
    ascending_sort.click()

    # Várjuk meg amíg updatel a lap
    time.sleep(2)

    # Ellenőrizzük, hogy tényleg helyes-e a sorrend
    products = browser.find_elements(By.CLASS_NAME, "featured__products")

    product_data = []
    for product in products:
        name = product.find_element(By.CLASS_NAME, "product__name").text
        price = product.find_element(By.CLASS_NAME, "featured__price").text
        product_data.append((name, price))

    time.sleep(3)

    is_sorted_ascending = False
    for i in range(len(product_data) - 1):
        is_sorted_ascending = product_data[i][1] <= product_data[i + 1][1]

    assert is_sorted_ascending

    sort_button.click()
    time.sleep(1)
    descending_sort = browser.find_element(By.XPATH, "//a[contains(text(),'Ár szerint csökkenő')]")
    descending_sort.click()
    time.sleep(2)

    products = browser.find_elements(By.CLASS_NAME, "featured__products")

    product_data = []
    for product in products:
        name = product.find_element(By.CLASS_NAME, "product__name").text
        price = product.find_element(By.CLASS_NAME, "featured__price").text
        product_data.append((name, price))

    is_sorted_descending = False
    for i in range(len(product_data) - 1):
        is_sorted_descending = product_data[i][1] >= product_data[i + 1][1]

    assert is_sorted_descending
    browser.quit()