import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dictionary"
export default class extends Controller {
  static targets = ["word", "result"]
  // A FAIRE OU TESTER SUPPRIMER LA TARGET RESULT ET REMPLACER LES OCCURENCES DE RESULT PAR WORD
  connect() {
    console.log("hello dictionary");
  }

  search(event) {
    event.preventDefault();
    const word = this.wordTarget.value;

    fetch(`https://wagon-dictionary.herokuapp.com/${word}`)
      .then(response => response.json())
      .then(data => {
        if (data.found) {
          this.resultTarget.innerHTML = `<p>Definition: ${data.definition}</p>`;
        } else {
          this.resultTarget.innerHTML = '<p>Word not found</p>';
        }
      })
      .catch(error => {
        this.resultTarget.innerHTML = `<p>Error: ${error.message}</p>`;
      });
  }
}
