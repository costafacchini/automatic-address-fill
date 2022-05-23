import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'name', 'street' ]

  _clearOptions(elementTarget) {
    elementTarget.innerHTML = ''
    elementTarget.options.add(new Option('Please select'))
  }

  _clearAndAddNewOptions(elementTarget, options) {
    this._clearOptions(elementTarget)

    options.forEach(item => elementTarget.options.add(new Option(item.name, item.id)))
  }

  cities({ target }) {
    const postalCode = target.value
    const elementTarget = this.nameTarget

    this._clearOptions(this.streetTarget)

    fetch(`/cities?postal_code_number=${postalCode}`)
      .then(response => response.json())
      .then(data => this._clearAndAddNewOptions(elementTarget, data))
  }

  streets({ target }) {
    const cityId = target.value
    const elementTarget = this.streetTarget

    fetch(`/streets?city_id=${cityId}`)
      .then(response => response.json())
      .then(data => this._clearAndAddNewOptions(elementTarget, data))
  }
}
