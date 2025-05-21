import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }
  static targets = ["courseSelect"]

  async change(event) {
    const cCode = event.target.value
    if (!cCode) return

    // Turbo Streams で HTML 部分だけ取得
    const response = await fetch(`${this.urlValue}/${cCode}/courses`, {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
    const turboStream = await response.text()
    Turbo.renderStreamMessage(turboStream)
  }
}