// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "bootstrap";

function sel(x) {
  return document.querySelector(x);
}

document.addEventListener("DOMContentLoaded", function () {
  sel("#add-weight-btn").addEventListener("click", function () {
    sel("#weight-field").value = null;
    sel("#weighed-on-field").value = new Date().toISOString().split("T")[0];
  });

  sel("#create-weight-modal").addEventListener("shown.bs.modal", function () {
    sel("#weight-field").focus();
  });

  sel("#weight-field,#weighed-on").addEventListener("input", function () {
    if (sel("#create-weight-modal form").checkValidity()) {
      sel("#save-weight-btn").removeAttribute("disabled");
    } else {
      sel("#save-weight-btn").setAttribute("disabled", "true");
    }
  });
});

// element.removeAttribute(attrName);

// $("#create-weight-modal").addEventListener('shown.bs.modal', function () {
//   // myInput.focus()
//   alert('hi')
// })

// $("#create-weight-modal").on("click", ".btn-primary", function () {
//   alert("hi 2");
//   // code
// });
