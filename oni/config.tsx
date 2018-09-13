import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
  console.log("config activated")

  // Input
  //
  // Add input bindings here:
  //
  oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

  //
  // Or remove the default bindings here by uncommenting the below line:
  //
  oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  //add custom config here, such as

  "ui.colorscheme": "material",
  "sidebar.default.open": false,
  "sidebar.plugins.enabled": true,

  // Weed out conflicts
  "autoClosingPairs.enabled": false,
  "oni.useDefaultConfig": false,
  "sidebar.enabled": false,
  "oni.hideMenu": true,
  //"oni.bookmarks": ["~/Documents"],

  "oni.enhancedSyntaxHighlighting": true,
  "oni.loadInitVim": "~/.dotfiles/oni/init.vim",
  "editor.fontSize": "14px",
  "editor.fontFamily": "Source Code Pro Semibold",

  // UI customizations
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "tabs.mode": "buffers",
  "tabs.height": "1.5em",
  "tabs.highlight": true,

  // Language Servers
  "language.vue.languageServer.command": "vls"
}
