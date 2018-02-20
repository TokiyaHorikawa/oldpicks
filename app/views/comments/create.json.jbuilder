json.id             @comment.id
json.user_id        @comment.user.id
json.name           @comment.user.name
json.content        @comment.content
json.avatar_image   @comment.user.avatar_image.url ? @comment.user.avatar_image.url : "/uploads/no-user-image.png"
json.company        @comment.user.company
json.position       @comment.user.position
json.time           @comment.before_time
json.like_counts    @comment.like_counts
