# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#per-page').val($.cookie('per_page'))

  $('#per-page').change ->
    per_page = $("#per-page option:selected").text()
    $.cookie('per_page', per_page, {expires: 30, path: '/'})
    location.reload()
    @

  $(".download").click ->
    href = $(this).attr("data")
    # alert("file:" + href)
    window.location = href
    @

  if $('#file-list').length > 0
    options = {
      valueNames: [ 'idx', 'open_at', 'name' ]
      page: $.cookie('per_page')
      plugins: [
        ListPagination({name: 'paginationTop',    paginationClass: 'paginationTop',    left: 1, right: 1})
        ListPagination({name: 'paginationBottom', paginationClass: 'paginationBottom', left: 1, right: 1})
      ]
    }
    fileList = new List('file-list', options)
    st = null
    et = null

    $('#search').keyup ->
      st = (new Date()).getTime()
      fileList.search($(@).val())
      et = (new Date()).getTime()
      $("#time").text "#{et - st} ミリ秒"

