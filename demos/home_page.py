from demos.page_object import PageObject
from selenium.webdriver.common.by import By


class HomePO(PageObject):

    homepage_title = "Let's Kode It"

    def is_at_homepage(self):
        self.assert_title(self.homepage_title)
