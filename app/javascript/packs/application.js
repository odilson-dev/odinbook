// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "../channels";
import { definitionsFromContext } from "@hotwired/stimulus-loading";
import "channels/private_chat_channel";
import "../stylesheets/application";
