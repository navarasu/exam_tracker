import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap";

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    debugger
    let backdrop = document.querySelector(".modal-backdrop");
    if (backdrop) {
      backdrop.remove();
    }
    this.modal = new Modal(this.element);
    this.modal.show();
    this.element.addEventListener("hidden.bs.modal", (event) => {
      document.body.style = ""; // helps to remove body style on second level modals
      this.element.remove();
    });
    this.element.addEventListener('turbo:submit-end', (event) => {
      if (event.detail.success && (this.element.id === "closable")) {
        document.body.style = ""; // helps to remove body style on second level modals
        this.modal.hide();
      }
    });
  }
}
