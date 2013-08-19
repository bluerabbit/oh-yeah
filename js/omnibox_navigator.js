var OmniBoxNavigator;

OmniBoxNavigator = (function() {
  function OmniBoxNavigator(inputText) {
    this.inputText = inputText;
  }

  OmniBoxNavigator.prototype.suggest = function(suggestCallback) {
    return suggestCallback(this.createSuggestParams());
  };

  OmniBoxNavigator.prototype.createSuggestParams = function() {
    if (this.startWith('t')) {
      return this.suggestGoogleTranslate();
    } else {
      return this.suggestOther();
    }
  };

  OmniBoxNavigator.prototype.suggestGoogleTranslate = function() {
    return [
      {
        content: 'http://translate.google.co.jp/?source=osdd#auto|auto|',
        description: 'Google 翻訳(t)'
      }
    ];
  };

  OmniBoxNavigator.prototype.suggestOther = function() {
    return [
      {
        content: 'http://translate.google.co.jp/?source=osdd#auto|auto|',
        description: 'Google 翻訳(n)'
      }, {
        content: 'http://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%83J%83%5E%83J%83i&url=search-alias%3Daps&field-keywords=',
        description: 'Amazon(n)'
      }
    ];
  };

  OmniBoxNavigator.prototype.startChar = function() {
    return this.inputText.split(' ')[0];
  };

  OmniBoxNavigator.prototype.startWith = function(char) {
    return this.startChar() === char;
  };

  OmniBoxNavigator.prototype.navigate = function(url) {
    return OmniBoxNavigator.navigate(url);
  };

  OmniBoxNavigator.navigate = function(url) {
    return chrome.tabs.getSelected(null, function(tab) {
      return chrome.tabs.update(tab.id, {
        url: url
      });
    });
  };

  return OmniBoxNavigator;

})();
