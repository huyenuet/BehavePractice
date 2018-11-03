import os
from behave import fixture
from selenium import webdriver
import config


@fixture()
def chrome_browser(context):

    # -- SETUP-FIXTURE PART:
    os.environ['webdriver.chrome.driver'] = config.CHROME_DRIVER_LOCATION
    chrome_options = get_chrome_options(False)
    context.browser = webdriver.Chrome(config.CHROME_DRIVER_LOCATION, chrome_options=chrome_options)

    if "--headless" in chrome_options.arguments:
        context.browser.maximize_window()

    # yield-statement to separate setup and cleanup part
    yield context.browser

    # -- CLEANUP-FIXTURE PART:
    context.browser.quit()


def get_chrome_options(headless=False):
    chrome_options = webdriver.ChromeOptions()
    # force Chrome to allow push notifications
    prefs = {'profile.default_content_setting_values.notifications': 1}
    # 0 ==> default,
    # 1 ==> Allow,
    # 2 ==> Block.

    chrome_options.add_experimental_option('prefs', prefs)

    if headless:
        chrome_options.add_argument('--headless')
        chrome_options.add_argument("--window-size=1920x1080")

    return chrome_options