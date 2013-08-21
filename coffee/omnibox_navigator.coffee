class OmniBoxNavigator
  constructor: (@inputText) ->

  #suggestType: ''

  suggest: (suggestCallback) ->
    suggestCallback(@createSuggestParams())

  createSuggestParams: ->
    [
      content:     'Google translate::' + @inputText
      description: 'Google translate'
    ,
      content:     'Amazon::' + @inputText
      description: 'Amazon'
    ]

  navigate: (inputText) ->
    type = inputText.split('::')[0]
    if type == 'Google translate'
      url = 'http://translate.google.co.jp/?source=osdd#auto|auto|'
    else if type == 'Amazon'
      url = 'http://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%83J%83%5E%83J%83i&url=search-alias%3Daps&field-keywords='
    else
      OmniBoxNavigator.navigate('https://www.google.co.jp/search?q=' + inputText)
      return
    OmniBoxNavigator.navigate(url + inputText.replace(type + '::', ''))

  @navigate: (url) ->
    chrome.tabs.getSelected null, (tab) ->
      chrome.tabs.update tab.id,
        url: url
