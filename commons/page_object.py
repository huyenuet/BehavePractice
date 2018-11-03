from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

"""
in this file, all action that we want to perform on element of our web page.
we define them here
I mean all the methods are here
"""


class PageObject:

    _force_username = 'development'
    _force_password = 'excelch@t'

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

    def is_element_present(self, locator, locator_type=By.CSS_SELECTOR, timeout=10):
        try:
            element = self.wait_until_presence_of_element_located(locator, locator_type, timeout=timeout)
            if element is not None:
                return True
            else:
                return False
        except Exception as e:
            print(e)
            return False

    def pass_authentication(self):
        WebDriverWait(self.driver, 5).until(EC.alert_is_present())
        authentication_alert = self.driver.switch_to_alert
        authentication_alert.send_keys(self._force_username)
        authentication_alert.send_keys(Keys.TAB)
        authentication_alert.send_keys(self._force_password)
        authentication_alert.accept()
