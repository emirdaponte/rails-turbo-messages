import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  disconnect() { this.close(); }

  close(e) {
    if (e) e.preventDefault();

    this.element.remove();
  }

  closeWithKeyboard(e) {
    if (e.keyCode === 27) this.close(e)
  }
}
