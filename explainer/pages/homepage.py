
from commons.page_object import PageObject


class HomepageOP(PageObject):
    _setting_menu_button = '#setting_menu'

    def wait_until_login_successfully(self):
        self.wait_until_presence_of_element_located(self._setting_menu_button)
