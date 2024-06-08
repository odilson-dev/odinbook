// app/javascript/controllers/private_chat_subscription_controller.js
import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

//Connects to data-controller="private_chat-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    privateChatId: Number,
  };

  connect() {
    console.log(
      `connecting to the ActionCable channel with id ${this.privateChatIdValue}`
    );

    this.channel = createConsumer().subscriptions.create(
      { channel: "PrivateChatChannel", id: this.privateChatIdValue },
      {
        received: (data) => {
          this.#insertMessage(data);
        },
      }
    );
  }

  // # = private method
  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  disconnect() {
    console.log("Unsubscribed from the Private Chat");
    this.channel.unsubscribe();
  }

  resetForm(event) {
    event.target.reset();
  }
}
