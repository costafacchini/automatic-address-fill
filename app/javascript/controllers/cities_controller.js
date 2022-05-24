import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'name', 'street', 'number' ]

  _clearOptions(elementTarget) {
    elementTarget.innerHTML = ''
    elementTarget.options.add(new Option('Please select'))
  }

  _clearAndAddNewOptions(elementTarget, options, fields) {
    const { key, value } = fields
    this._clearOptions(elementTarget)

    options.forEach(item => elementTarget.options.add(new Option(item[value], item[key])))
  }

  cities({ target }) {
    const postalCode = target.value
    const elementTarget = this.nameTarget

    this._clearOptions(this.streetTarget)
    this._clearOptions(this.numberTarget)

    fetch(`/cities?postal_code_number=${postalCode}`)
      .then(response => response.json())
      .then(data => this._clearAndAddNewOptions(elementTarget, data, { value: 'name', key: 'id' }))
  }

  streets({ target }) {
    const cityId = target.value
    const elementTarget = this.streetTarget

    this._clearOptions(this.numberTarget)

    fetch(`/streets?city_id=${cityId}`)
      .then(response => response.json())
      .then(data => this._clearAndAddNewOptions(elementTarget, data, { value: 'name', key: 'id' }))
  }

  numbers({ target }) {
    const streetId = target.value
    const elementTarget = this.numberTarget

    fetch(`/street_numbers?street_id=${streetId}`)
      .then(response => response.json())
      .then(data => this._clearAndAddNewOptions(elementTarget, data, { value: 'number', key: 'id' }))
  }
}
