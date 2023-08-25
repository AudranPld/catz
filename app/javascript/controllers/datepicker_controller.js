import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = {disabledDates: Array}
  connect() {
    flatpickr(this.element, {
      onClose: function(selectedDates, dateStr, instance){
     },
     inline: true,
     dateFormat: "Y-m-d",
     mode: "range",
     minDate: "today",
     disable: this.disabledDatesValue
    })
  }


}
