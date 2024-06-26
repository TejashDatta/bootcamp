import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    document.querySelector('input[data-behavior="room_speaker"]')
      .addEventListener('keypress', event => {
        if (event.key === 'Enter') {
          this.speak(event.target.value);
          event.target.value = '';
          return event.preventDefault();
        }
      });
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.querySelector('#messages')
    messages.insertAdjacentHTML('beforeend', data['message'])
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});
