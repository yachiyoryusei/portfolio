$(document).on('turbolinks:load', function() {
  $('post_btn').on('click', function(){
    var date = $('post_date').val();
    var type0 = $('post_type_0').val();
    var type1 = $('post_type_1').val();
    var category = $('post_category_id').val();
    var amount =$('post_amount').val();
    var note = $('post_note').val();
    
    $.ajax({
      type: 'POST',
      url: 'posts/index',
      data: { 
        date: date,
        type0: type0,
        type1: type1,
        category: category,
        amount: amount,
        note: note
      },
      dataType: 'json'
    })
    
    
  })
})