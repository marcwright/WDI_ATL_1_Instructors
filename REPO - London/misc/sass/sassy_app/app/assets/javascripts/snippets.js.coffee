# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  editorWidth  = 500
  editorHeight = 150

  commonEditorOptions =
    keyMap          : "sublime"
    smartIndent     : true
    indentUnit      : 2
    tabSize         : 2
    viewportMargin  : Infinity
    extraKeys:
      "Cmd-S" : (e) -> $('form').submit()

  defaultEditorOptions = $.extend {}, commonEditorOptions,
    theme           : "night"
    lineWrapping    : false
    indentWithTabs  : false
    lineNumbers     : true

  markdownEditorOptions = $.extend {}, commonEditorOptions,
    mode            : "text/x-markdown"
    lineWrapping    : true

  hamlEditorOptions = $.extend {}, defaultEditorOptions,
    mode: "text/x-haml"

  scssEditorOptions = $.extend {}, defaultEditorOptions,
    mode: "text/x-scss"

  htmlEditorOptions = $.extend {}, defaultEditorOptions,
    mode: "text/html"

  cssEditorOptions  = $.extend {}, defaultEditorOptions,
    mode: "text/css"

  readOnlyOptions = 
    readOnly        : true
    cursorBlinkRate : 0

  readOnlyHamlEditorOptions = $.extend {}, hamlEditorOptions, readOnlyOptions
  readOnlyScssEditorOptions = $.extend {}, scssEditorOptions, readOnlyOptions
  readOnlyHtmlEditorOptions = $.extend {}, htmlEditorOptions, readOnlyOptions
  readOnlyCssEditorOptions  = $.extend {}, cssEditorOptions,  readOnlyOptions

  $readOnlyHamlSnippets = $('pre.snippet.read-only-haml-snippet')
  $readOnlyScssSnippets = $('pre.snippet.read-only-scss-snippet')

  $readOnlyHtmlSnippets = $('pre.snippet.read-only-html-snippet')
  $readOnlyCssSnippets  = $('pre.snippet.read-only-css-snippet')

  $hamlSnippets = $('.snippet.haml-snippet')
  $scssSnippets = $('.snippet.scss-snippet')
  $markdownSnippets = $('.snippet.markdown')


  prepareReadOnlyEditor = (el, options) ->
    $this = $(el)
    $code = if options.mode is "text/html"
      $this.html()
    else
      $this.text()
    $this.empty()
    CodeMirror el, $.extend({}, options, value: $code)

  $readOnlyHamlSnippets.each ->
    prepareReadOnlyEditor this, readOnlyHamlEditorOptions

  $readOnlyScssSnippets.each ->
    prepareReadOnlyEditor this, readOnlyScssEditorOptions

  $readOnlyHtmlSnippets.each ->
    prepareReadOnlyEditor this, readOnlyHtmlEditorOptions

  $readOnlyCssSnippets.each ->
    prepareReadOnlyEditor this, readOnlyCssEditorOptions

  $hamlSnippets.each ->
    CodeMirror.fromTextArea this, hamlEditorOptions

  $scssSnippets.each ->
    CodeMirror.fromTextArea this, scssEditorOptions

  $markdownSnippets.each ->
    CodeMirror.fromTextArea this, markdownEditorOptions

  $(document).on 'keydown', null, 'ctrl+s meta+s', (e) ->
    e.preventDefault()
    $('form').submit()

