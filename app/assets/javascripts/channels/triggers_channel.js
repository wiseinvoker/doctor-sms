// app/javascript/channels/triggers_channel.js
import consumer from "./consumer";

consumer.subscriptions.create("TriggersChannel", {
  received(data) {
    // Handle received data (triggers or notifications) and update UI
    console.log(data);
  }
});
