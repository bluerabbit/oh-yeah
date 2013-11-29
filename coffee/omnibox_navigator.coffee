class OmniBoxNavigator
  constructor: (@inputText) ->

  suggest: (suggestCallback) ->
    suggestCallback(@createSuggestParams())

  createSuggestParams: ->
    [
      content:     "http://translate.google.co.jp/?source=osdd#auto|auto|#{@inputText}"
      description: 'Google 翻訳'
    ,
      content:     "http://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%83J%83%5E%83J%83i&url=search-alias%3Daps&field-keywords=#{@inputText}"
      description: 'Amazon'
    ]

  navigate: (inputText) ->
    OmniBoxNavigator.navigate(inputText)

  @navigate: (url) ->
    chrome.tabs.getSelected null, (tab) ->
      chrome.tabs.update tab.id,
        url: url
