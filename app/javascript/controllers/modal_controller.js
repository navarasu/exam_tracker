import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap";
import Datepicker from 'vanillajs-datepicker/Datepicker';

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    debugger
    let backdrop = document.querySelector(".modal-backdrop");
    if (backdrop) {
      backdrop.remove();
    }
    var datepickers = [].slice.call(document.querySelectorAll('.datepicker-input'))
    var datepickersList = datepickers.map(function (el) {
        return new Datepicker(el, {
        buttonClass: 'btn',
        format: 'dd/mm/yyyy',
        autohide: true
      });
    })

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
