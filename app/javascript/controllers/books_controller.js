import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="books"
export default class extends Controller {
  connect() {
    debugger;
    this.element.textContent = "Hello World!";
  }
}
