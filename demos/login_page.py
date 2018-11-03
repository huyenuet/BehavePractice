from demos.page_object import PageObject
from selenium.webdriver.common.by import By


class LoginPO(PageObject):

    login_btn_xpath = "//input[@value='Log In']"
    user_email_id = "user_email"
    password_id = "user_password"

    def wait_until_directed_to_login_page(self):
        self.wait_until_presence_of_element_located(self.user_email_id, By.ID)

    def get_login_btn(self):
        return self.get_element(self.login_btn_xpath, By.XPATH)

    def click_login_btn(self):
        self.wait_then_click(self.login_btn_xpath, By.XPATH)

    def enter_email(self, email):
        email_element = self.get_element(self.user_email_id, By.ID)
        email_element.send_keys(email)

    def enter_pass(self, password):
        password_element = self.get_element(self.password_id, By.ID)
        password_element.send_keys(password)
