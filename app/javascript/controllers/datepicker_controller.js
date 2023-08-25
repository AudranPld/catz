import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      onClose: function(selectedDates, dateStr, instance){
        console.log(selectedDates);
        console.log(selectedDates[0])
     },
     inline: true,
     dateFormat: "Y-m-d",
     mode: "range",
     minDate: "today",
     disable: ["2023-08-30"]
    })
  }


}
