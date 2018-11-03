from behave.fixture import use_fixture_by_tag

from explainer.fixtures import chrome_browser

fixture_registry = {
    'fixture.chrome.browser': chrome_browser
}


def before_tag(context, tag):
    if tag.startswith('fixture.'):
        return use_fixture_by_tag(tag, context, fixture_registry)
