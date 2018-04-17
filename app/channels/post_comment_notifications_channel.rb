class PostCommentNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_comment_notifications"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
