var navi;

navi = null;

chrome.omnibox.onInputChanged.addListener(function(inputText, suggestCallback) {
  navi = new OmniBoxNavigator(inputText);
  return navi.suggest(suggestCallback);
});

chrome.omnibox.onInputEntered.addListener(function(inputText, disposition) {
  return navi.navigate(inputText);
});
