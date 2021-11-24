$(document).on('turobolinks:load', function() {
  $('categories_btn').on('click', function(){
    var name = $('category_name').val();
    
    $.ajax({
      type: 'POST',
      url: 'categories/index',
      data: {
        name: name
      },
      dataType: 'json'
    })
  })
})