navi = null

chrome.omnibox.onInputChanged.addListener (inputText, suggestCallback) ->
  navi = new OmniBoxNavigator(inputText)
  navi.suggest(suggestCallback)

chrome.omnibox.onInputEntered.addListener (inputText, disposition) ->
  navi.navigate(inputText)
