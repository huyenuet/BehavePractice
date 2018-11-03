from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

"""
in this file, all action that we want to perform on element of our web page.
we define them here
I mean all the methods are here
"""


class PageObject:

    def __init__(self, driver):
        self.driver = driver

    def get_element(self, locator, locator_type=By.CSS_SELECTOR):
        return self.driver.find_element(locator_type, locator)

    def wait_then_click(self, locator, locator_type=By.CSS_SELECTOR, timeout=10):
        wait = WebDriverWait(self.driver, timeout)
        element = wait.until(EC.element_to_be_clickable((locator_type, locator)))
        element.click()

    def wait_until_presence_of_element_located(self, locator, locator_type=By.CSS_SELECTOR, timeout=10):
        wait = WebDriverWait(self.driver, timeout)
        return wait.until(EC.presence_of_element_located((locator_type, locator)))

    def assert_title(self, expected_title):
        assert expected_title in self.driver.title
