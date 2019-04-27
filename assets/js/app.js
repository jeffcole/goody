// Parcel automatically bundles all modules in your entry points.
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import { Elm } from "../src/Main.elm";

var app = Elm.Main.init({
  node: document.getElementById("elm")
});
