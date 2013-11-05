jQuery ->
  watchLikeBtn()

watchLikeBtn = ->
  jQuery(document).on 'click', '#likeBtn', ->
    $article_id = jQuery('#article_id')
    $topic_id = jQuery('#article_topic_id')
    jQuery.ajax
      url: '/topics/'+$topic_id.val()+'/articles/'+$article_id.val()+'/like'
      type: 'PATCH'
      dataType: 'script'
      data:
        id: $article_id.val()