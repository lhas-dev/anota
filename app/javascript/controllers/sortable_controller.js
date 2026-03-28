import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: "[data-sortable-handle]",
      animation: 150,
      ghostClass: "opacity-30",
      onEnd: this.#updatePositions.bind(this)
    })
  }

  disconnect() {
    this.sortable.destroy()
  }

  #updatePositions() {
    const ids = Array.from(this.element.children)
      .map(el => el.dataset.habitId)
      .filter(Boolean)

    const csrfToken = document.querySelector("meta[name='csrf-token']")?.content

    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken
      },
      body: JSON.stringify({ habit_ids: ids })
    })
  }
}
