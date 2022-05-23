import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'name' ]

  reload({ target }) {
    const postalCode = target.value
    const elementTarget = this.nameTarget

    fetch(`/cities?postal_code_number=${postalCode}`)
      .then(response => response.json())
      .then(data => {
        elementTarget.options.remove(elementTarget.options.length - 2)

        data.forEach(item => elementTarget.options.add(new Option(item.name, item.id)))
      })
  }
}
