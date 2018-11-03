import time

from behave import *
from demos.landing import LandingPO
from demos.login_page import LoginPO
from demos.home_page import HomePO


@step('I am at the landing page')
def step_impl(context):
    """
    create a landing page object (landing_po) to work with landing page
    :param context:
    :return:
    """
    landing_po = LandingPO(context.browser)  # ~ lading_po = new landing(PageObject)
    context.browser.get(landing_po.base_url)


@when('I click on log in button on the navigation bar')
def step_impl(context):
    landing_po = LandingPO(context.browser)
    landing_po.click_login_btn()
    time.sleep(2)


@then("I should be directed to login page")
def step_impl(context):
    login_po = LoginPO(context.browser)
    login_po.wait_until_directed_to_login_page()


@when("I enter correct email address and password")
def step_impl(context):
    login_po = LoginPO(context.browser)
    login_po.enter_email("smartmouse.fun@gmail.com")
    login_po.enter_pass("111111")


# @when("I click the login button")
# def step_impl(context):
#     login_po = LoginPO(context.browser)
#     login_po.click_login_btn()


@then("I should be directed to homepage")
def step_impl(context):
    home_po = HomePO(context.browser)
    home_po.is_at_homepage()


# demo for text
@given("a sample text loaded into the frobulator")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print(context.text)
    print("\n")


@when("we activate the frobulator")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print(context.text)
    print("\n")


@then("we will find it similar to English")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print(context.text)


# demo for table
@given("a set of specific users")
def step_impl(context):
    for row in context.table:
        print(row['name'] + ": " + row['department'])
        print("\n")


@when('I do the same thing as before')
def step_impl(context):
    context.execute_steps(u'''
        when I press the login button
    ''')


@given('I enter "{key}" into search box')
def step_impl(context, key):
    """
    :type context: behave.runner.Context
    """
    print(key)