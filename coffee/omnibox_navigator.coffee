class OmniBoxNavigator
  constructor: (@inputText) ->

  suggest: (suggestCallback) ->
    suggestCallback(@createSuggestParams())

  createSuggestParams: ->
    if @startWith('t')
      @suggestGoogleTranslate()
    else
      @suggestOther()

  startChar: ->
    @inputText.split(' ')[0]

  startWith: (char) ->
    @startChar() == char

  suggestGoogleTranslate: ->
    [
      content:     'http://translate.google.co.jp/?source=osdd#auto|auto|'
      description: 'Google 翻訳(t)'
    ]

  suggestOther: ->
    [
      content:     'http://translate.google.co.jp/?source=osdd#auto|auto|'
      description: 'Google 翻訳(n)'
    ,
      content:     'http://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%83J%83%5E%83J%83i&url=search-alias%3Daps&field-keywords='
      description: 'Amazon(n)'
    ]

  navigate: (inputText) ->
    OmniBoxNavigator.navigate(inputText)

  @navigate: (url) ->
    chrome.tabs.getSelected null, (tab) ->
      chrome.tabs.update tab.id,
        url: url
