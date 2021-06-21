// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox.js';
import { filterValue } from '../plugins/init_mapbox.js';

import { initAutocomplete } from '../plugins/init_autocomplete.js';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  filterValue();
})

const mapButton = document.getElementById("map-btn");
const map = document.querySelector('#map-hide');
mapButton.addEventListener("click", (event) => {
  event.preventDefault();
  map.classList.toggle("open-map");
  map.classList.toggle("closed-map");
  console.log(mapButton)
  if (mapButton.innerText == "Open map") {
    mapButton.innerText = "Close map";
  } else {
    mapButton.innterText = "Open map";
  };
  
});

map.on('idle', function(){
  map.resize();
});
