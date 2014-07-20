# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  fileList = null

  # ページネーションの表示
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
    listObject

  # ソート条件を得る
  # 表示件数を変更する前にソート受験を退避しておくのに利用する
  my_find_sort_info = ->
    sortcols = []
    direction = null
    if $('.sort.asc').length > 0
      sortcols = $('.sort.asc')
      direction = 'asc'
    if $('.sort.desc').length > 0
      sortcols = $('.sort.desc')
      direction = 'desc'
    [sortcols, direction]

  # ソート処理
  my_sort = (sortcols, direction) ->
    $(sortcols).removeClass('asc').removeClass('desc').addClass(direction)

  # 絞り込み処理
  my_search = (pat) ->
    return @ unless fileList
    st = (new Date()).getTime()
    fileList.search(pat)
    et = (new Date()).getTime()
    str = ''
    str = "ヒット #{fileList.matchingItems.length} 件 (#{et - st} ミリ秒)" if pat && pat.length > 0
    $("#time").text(str)
    @

  # 表示件数の変更処理
  $('#per-page').change ->
    per_page = $("#per-page option:selected").text()
    $.cookie('per_page', per_page, {expires: 30, path: '/'})
    location.reload() unless fileList

    [sortcols, direction] = my_find_sort_info()
    i.show() for i in fileList.items
    listOgject = my_show_paging()
    listOgject.search($('.search').val()) if $('.search')
    my_sort(sortcols, direction) if sortcols.length && direction
    listOgject
    @

  # インクリメンタルサーチ処理
  $('.search').keyup ->
    my_search(($(@).val()))
    @

  # ダウンロードボタンのクリック処理
  $(".download").click ->
    href = $(this).attr("data")
    # alert("file:" + href)
    window.location = href
    @

  # HTMLがロード後にページネーション表示する
  # その後の ソート、絞り込み、表示件数変更は, ロードされた HTML で処理する。
  fileList = my_show_paging() if $('#file-list').length > 0
