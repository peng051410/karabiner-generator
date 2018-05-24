package main

// TODO: add variables
// If variable starts with 'km_', replace the variable:
// km_clone_github_repo = 'g: clone GitHub repo'
// with:
// "osascript -e 'tell application "Keyboard Maestro Engine" do script "g: clone GitHub repo" end tell"

// If variable starts with alf_, replace the variable:
// alf_search_lobsters = 'lobsters', 'nikivi.search-the-web'
// with:
// osascript -e 'tell application "Alfred 3" to run trigger "lobsters" in workflow "nikivi.search-the-web" with argument ""'

// If variable does not start with either 'alf_' or 'km_', save whatever string is added to the var.

// TODO: define sticky key
// Will make s -> trigger whatever is in km_clone_github_repo variable.
// s.a = km_clone_github_repo

// Will make s -> b write 'TODO: ' as series of chars. (S) = Shift being held down. (CT) = Ctrl beild held down.
// (S/CT) = Shift + Ctrl being held down
// s.b = T (S) | O (S) | D (S) | O (S) | : | Space

// TODO: define simultaneous keys
// Will make j + k pressed together trigger km_screenshot_to_inbox variable.
// j/k = km_clone_github_repo
