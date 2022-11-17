import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {
  static targets = ["start", "end", "price", "total"]

  connect() {
  }

  changeTotal() {
    const startValue = this.startTarget.value
    const endValue = this.endTarget.value

    if (startValue.length !== 0 && endValue.length !== 0) {
      const startDate = new Date(startValue)
      const endDate = new Date(endValue)
      const days = (endDate - startDate) / 86400000 + 1

      if (days > 0) {
        const pluralizer = days === 1 ? "" : "s"
        this.totalTarget.innerHTML = `Total price for ${days} day${pluralizer}: $${this.priceTarget.value * days}`
        this.totalTarget.classList.add("total-price")
      } else {
        this.totalTarget.innerHTML = ""
        this.totalTarget.classList.remove("total-price")
      }
    } else {
      this.totalTarget.innerHTML = ""
      this.totalTarget.classList.remove("total-price")
    }
  }
}
