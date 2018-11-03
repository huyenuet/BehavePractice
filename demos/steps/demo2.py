import time

from behave import *
from demos.landing import LandingPO
from demos.login_page import LoginPO
from demos.home_page import HomePO

@given ("I am at https://excel.got-it.io/")
def step_impl(context):
    context.browser.get("https://excel.got-it.io/")
    time.sleep(10)
