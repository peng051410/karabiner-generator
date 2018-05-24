package main

// TODO: add variables
// If variable starts with 'km_', replace below variable:
// km_screenshot_to_inbox = 'g: screenshot to Pixave Inbox'
// with:
// "osascript -e 'tell application "Keyboard Maestro Engine" do script "g: screenshot to Pixave Inbox" end tell"

// If variable starts with alf_, replace below variable:
// alf_search_lobsters = 'lobsters', 'nikivi.search-the-web'
// with:
// osascript -e 'tell application "Alfred 3" to run trigger "lobsters" in workflow "nikivi.search-the-web" with argument ""'

// If variable does not start with either 'alf_' or 'km_', save whatever string is added to the var.

// TODO: define sticky key
// Will make s -> a trigger whatever is in 'km_screenshot_to_inbox' variable
// s.a = km_screenshot_to_inbox

// Will make s -> b write 'TODO: ' as series of chars. (S) = Shift being held down. (CT) = Ctrl beild held down.
// (S/CT) = Shift + Ctrl being held down
// s.b = T (S) | O (S) | D (S) | O (S) | : | Space

// TODO: define simultaneous keys
// Will make j + k pressed together trigger km_screenshot_to_inbox variable.
// j/k = km_screenshot_to_inbox
