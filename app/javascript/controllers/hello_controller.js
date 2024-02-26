import { Controller } from "@hotwired/stimulus"
import Datepicker from 'vanillajs-datepicker/Datepicker';
import { visit } from '@hotwired/turbo';
export default class extends Controller {
  connect() {
    var datepickers = [].slice.call(document.querySelectorAll('.datepicker-input'))
    var datepickersList = datepickers.map(function (el) {
        let datepicker = new Datepicker(el, {
        buttonClass: 'btn',
        format: 'dd/mm/yyyy',
        autohide: true
      });

      el.addEventListener('changeDate', (e) => {
        console.log(e.target.value);
         visit('/attendances?date='+e.target.value.replaceAll('/','-'));
  })
    })
  }
}

