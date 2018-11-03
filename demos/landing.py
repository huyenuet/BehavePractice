from demos.page_object import PageObject
from selenium.webdriver.common.by import By


class LandingPO(PageObject):
    base_url = "https://learn.letskodeit.com/p/practice"
    login_btn_link_text = "Login"

    def get_login_btn(self):
        return self.get_element(self.login_btn_link_text, By.LINK_TEXT)

    def click_login_btn(self):
        self.wait_then_click(self.login_btn_link_text, By.LINK_TEXT)