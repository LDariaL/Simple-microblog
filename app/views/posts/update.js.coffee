$("#post_categories_select").empty()
   .append("<%= escape_javascript(render @posts) %>")