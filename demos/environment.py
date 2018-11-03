# -- FILE: demos/environment.py
# here, we define before_all(), before_tag(), after_tag(), ...

from demos.fixtures import chrome_browser
from behave.fixture import use_fixture_by_tag, use_fixture

fixture_registry = {
    'fixture.chrome.browser': chrome_browser
}


# 2 following functions perform the same behavior
# but the first one is more flexible for future job. The first one is stick with fixture_registry

def before_tag(context, tag):
    if tag.startswith('fixture.'):
        return use_fixture_by_tag(tag, context, fixture_registry)

#
# def before_all(context):
#     use_fixture(chrome_browser, context)
