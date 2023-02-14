$ ->
  $(document).on 'change', '#post_categories_select', (evt) ->
    $.ajax 'update',
      type: 'GET'
      dataType: 'script'
      data: {
        post_category_id: $("#post_categories_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Post category select OK!")