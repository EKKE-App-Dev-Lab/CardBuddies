import pytest
from selenium import webdriver


@pytest.fixture
def browser():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()


def test_landing_page_open(browser):
    browser.get('http://localhost/cardbuddies/')
    assert 'CardBuddies' in browser.title
