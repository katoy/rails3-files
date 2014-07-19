# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  fileList = null

  my_show_paging = ->
    options = {
      valueNames: [ 'idx', 'open_at', 'name' ]
      page: $.cookie('per_page')
      plugins: [
        ListPagination({name: 'paginationTop',    paginationClass: 'paginationTop',    left: 1, right: 1})
        ListPagination({name: 'paginationBottom', paginationClass: 'paginationBottom', left: 1, right: 1})
      ]
    }
    listObject = new List('file-list', options)

  my_search = (pat) ->
    st = (new Date()).getTime()
    fileList.search(pat)
    et = (new Date()).getTime()
    $("#time").text "#{et - st} ミリ秒"

  update_paging = ->
    i.show() for i in fileList.items
    my_show_paging()
    $('.search').val('')

  $('#per-page').val($.cookie('per_page'))

  $('#per-page').change ->
    per_page = $("#per-page option:selected").text()
    $.cookie('per_page', per_page, {expires: 30, path: '/'})
    update_paging()
    @

  $(".download").click ->
    href = $(this).attr("data")
    # alert("file:" + href)
    window.location = href
    @

  $('.search').keyup -> my_search(($(@).val()))

  fileList = my_show_paging()
