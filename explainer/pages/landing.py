
from commons.page_object import PageObject


class LandingOP(PageObject):

    _force_username = 'development'
    _force_password = 'excelch@t'
    explainer_site = "https://expert-excel.got-it.io/"
    url = "https://" + _force_username + ":" + _force_password + "@expert-excel.got-it.io/"

    _login_btn_ = '#navbar > ul > li > a'
    _login_submit_button = '#navbar > ul > li > div > div > form > div.row.m-t-10 > div > button'
    _email_input = '#login_email'
    _password_input = '#login_password'
    _tos_modal_next_button = '#modal-terms-and-conditions button.gi-popupControl--Right.btn.btn-warning.btn-block'

    def click_login_button(self):
        self.wait_then_click(self._login_btn_)

    def enter_email(self, email):
        self.get_element(self._email_input).send_keys(email)

    def enter_password(self, password):
        self.get_element(self._password_input).send_keys(password)

    def click_submit_btn(self):
        self.wait_then_click(self._login_submit_button)

    # terms and conditions
    def is_tos_modal_present(self):
        return self.is_element_present(self._tos_modal_next_button)

    def click_accept_terms_and_conditions(self):
        self.get_element(self._tos_modal_next_button).click()

    # pass authentication
    def pass_required_authentication(self):
        self.pass_authentication()
