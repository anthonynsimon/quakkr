$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var postId = $(this).data("post-id");
      $("#post_" + postId + " #comments").html(data);
    })
  }); 
});