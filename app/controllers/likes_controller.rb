class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.build(tweet_id: params[:tweet_id])
    if like.save
      render 'create.js.erb'
    else
      # 保存に失敗した場合の処理
    end
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    if like.destroy
      render 'destroy.js.erb'
    else
      # 削除に失敗した場合の処理
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end