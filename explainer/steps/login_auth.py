from behave import given, when, then
from explainer.model.users import Explainer
from explainer.pages.landing import LandingOP
from explainer.pages.homepage import HomepageOP


@given("I am at the expert landing")
def step_impl(context):
    landing_op = LandingOP(context.browser)
    context.browser.get(landing_op.url)
    # context.browser.get(landing_op.explainer_site)
    # landing_op.pass_required_authentication()


@when("I click on the login button")
def step_impl(context):
    landing_op = LandingOP(context.browser)
    landing_op.click_login_button()


@when('I enter correct email and correct password')
def step_impl(context):
    explainer_op = Explainer("huyen+12345@gotitapp.co", "Sam111!!!")
    landing_op = LandingOP(context.browser)
    landing_op.enter_email(explainer_op.get_email())
    landing_op.enter_password(explainer_op.get_password())


@when('I click on the login submit button')
def step_impl(context):
    landing_op = LandingOP(context.browser)
    landing_op.click_submit_btn()


@when('I accept the term and condition')
def step_impl(context):
    landing_op = LandingOP(context.browser)
    if landing_op.is_tos_modal_present():
        landing_op.click_accept_terms_and_conditions()


@then('I should be redirected to the homepage')
def step_impl(context):
    home_op = HomepageOP(context.browser)
    home_op.wait_until_login_successfully()


@when("I click logo button")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    pass