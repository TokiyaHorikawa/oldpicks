module CommentsHelper
  def top_user_name(comment)
    comment ? comment.user.name : nil ;
  end

  def top_user_position(comment)
    comment ? comment.user.position : nil ;
  end

  def top_user_comment(comment)
    comment ? comment.content.truncate(100) : "コメントはありません" ;
  end

  def top_user_avatar_image(comment)
    image_tag comment ? comment.user.avatar_image : 'user-image.png', { class: 'icon-image'}
  end
end
