# app/channels/triggers_channel.rb
class TriggersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'triggers_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
