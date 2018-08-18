#!/usr/bin/env ruby
require_relative 'karabiner.rb'

# TODO: alphabetize all manipulators based on trigger key. use vim magic

# TODO: add HS calls. do it in background
# hammerspoon://openConsole -> opens console
# hammerspoon://showTime -> shows time
# hammerspoon://reloadConfig -> reloads HS
# hammerspoon://test -> tests some HS func

# TODO: remove need for print() statements
def main
  colonkey()
  print(',')
  swapkeys()
  print(',')
  simkeys()
  print(',')
  wkey()
  print(',')
  ekey()
  print(',')
  ikey()
  print(',')
  okey()
  print(',')
  akey()
  print(',')
  skey()
  print(',')
  fkey()
  print(',')
  zkey()
  print(',')
  nkey()
end

def swapkeys()
    puts JSON.pretty_generate(
        'description' => 'swap keys',
        'manipulators' => [
            swapkey("semicolon", "semicolon", nil, ["caps_lock"], ["left_shift"]), # ; -> :
            swapkey("semicolon", "semicolon", ["shift"], ['any'], nil), # shift + : -> ;
        ].flatten,
  )
end

def simkeys()
    puts JSON.pretty_generate(
        'description' => 'sim keys',
        'manipulators' => [
            simshell('j', 'k', alfred('google', 'net.deanishe.alfred-searchio')), 
            simshell('j', 'semicolon', alfred('tabs', 'net.deanishe.alfred.safari')), 
            simkey('j', 'l', 'spacebar', ['command']),
            simshell('spacebar', 'k', alfred('', 'net.deanishe.alfred.safari')), 
            simshell('j', 'semicolon', alfred('tabs', 'net.deanishe.alfred.safari')), 
            simshell('j', 'semicolon', alfred('tabs', 'net.deanishe.alfred.safari')), 
        ].flatten,
  )
end

def colonkey()
  puts JSON.pretty_generate(
        'description' => 'colon - shift',
        'manipulators' => [
          key("semicolon", "q", "q", ["shift"]),
          key("semicolon", "w", "w", ["shift"]),
          key("semicolon", "e", "e", ["shift"]),
          key("semicolon", "r", "r", ["shift"]),
          key("semicolon", "t", "t", ["shift"]),
          key("semicolon", "y", "y", ["shift"]),
          key("semicolon", "u", "u", ["shift"]),
          key("semicolon", "u", "u", ["shift"]),
          key("semicolon", "i", "i", ["shift"]),
          key("semicolon", "o", "o", ["shift"]),
          key("semicolon", "p", "p", ["shift"]),
          key("semicolon", "a", "a", ["shift"]),
          key("semicolon", "s", "s", ["shift"]),
          key("semicolon", "d", "d", ["shift"]),
          key("semicolon", "f", "f", ["shift"]),
          key("semicolon", "g", "g", ["shift"]),
          key("semicolon", "h", "h", ["shift"]),
          key("semicolon", "j", "j", ["shift"]),
          key("semicolon", "k", "k", ["shift"]),
          key("semicolon", "l", "l", ["shift"]),
          key("semicolon", "z", "z", ["shift"]),
          key("semicolon", "x", "x", ["shift"]),
          key("semicolon", "c", "c", ["shift"]),
          key("semicolon", "v", "v", ["shift"]),
          key("semicolon", "b", "b", ["shift"]),
          key("semicolon", "n", "n", ["shift"]),
          key("semicolon", "m", "m", ["shift"]),
        ].flatten,
  )
end

def qkey()
  puts JSON.pretty_generate(
        'description' => 'q - cmd + shift',
        'manipulators' => [
          key("q", "return_or_enter", "return_or_enter", ["command", "shift"]),
          key("q", "escape", "escape", ["command", "shift"]),
          key("q", "delete_or_backspace", "delete_or_backspace", ["command", "shift"]),
          key("q", "delete_forward", "delete_forward", ["command", "shift"]),
          key("q", "tab", "tab", ["command", "shift"]),
          key("q", "spacebar", "spacebar", ["command", "shift"]),
          key("q", "hyphen", "hyphen", ["command", "shift"]),
          key("q", "equal_sign", "equal_sign", ["command", "shift"]),
          key("q", "open_bracket", "open_bracket", ["command", "shift"]),
          key("q", "close_bracket", "close_bracket", ["command", "shift"]),
          key("q", "backslash", "backslash", ["command", "shift"]),
          key("q", "non_us_pound", "non_us_pound", ["command", "shift"]),
          key("q", "semicolon", "semicolon", ["command", "shift"]),
          key("q", "quote", "quote", ["command", "shift"]),
          key("q", "grave_accent_and_tilde", "grave_accent_and_tilde", ["command", "shift"]),
          key("q", "comma", "comma", ["command", "shift"]),
          key("q", "period", "period", ["command", "shift"]),
          key("q", "comma", "comma", ["command", "shift"]),
          key("q", "period", "period", ["command", "shift"]),
          key("q", "slash", "slash", ["command", "shift"]),
          key("q", "non_us_backslash", "non_us_backslash", ["command", "shift"]),
          key("q", "slash", "slash", ["command", "shift"]),
          key("q", "non_us_backslash", "non_us_backslash", ["command", "shift"]),
          key("q", "a", "a", ["command", "shift"]),
          key("q", "b", "b", ["command", "shift"]),
          key("q", "c", "c", ["command", "shift"]),
          key("q", "d", "d", ["command", "shift"]),
          key("q", "e", "e", ["command", "shift"]),
          key("q", "f", "f", ["command", "shift"]),
          key("q", "g", "g", ["command", "shift"]),
          key("q", "h", "h", ["command", "shift"]),
          key("q", "i", "i", ["command", "shift"]),
          key("q", "j", "j", ["command", "shift"]),
          key("q", "k", "k", ["command", "shift"]),
          key("q", "l", "l", ["command", "shift"]),
          key("q", "m", "m", ["command", "shift"]),
          key("q", "n", "n", ["command", "shift"]),
          key("q", "o", "o", ["command", "shift"]),
          key("q", "p", "p", ["command", "shift"]),
          key("q", "r", "r", ["command", "shift"]),
          key("q", "s", "s", ["command", "shift"]),
          key("q", "t", "t", ["command", "shift"]),
          key("q", "u", "u", ["command", "shift"]),
          key("q", "v", "v", ["command", "shift"]),
          key("q", "w", "w", ["command", "shift"]),
          key("q", "x", "x", ["command", "shift"]),
          key("q", "y", "y", ["command", "shift"]),
          key("q", "z", "z", ["command", "shift"]),
          key("q", "1", "1", ["command", "shift"]),
          key("q", "2", "2", ["command", "shift"]),
          key("q", "3", "3", ["command", "shift"]),
          key("q", "4", "4", ["command", "shift"]),
          key("q", "5", "5", ["command", "shift"]),
          key("q", "6", "6", ["command", "shift"]),
          key("q", "7", "7", ["command", "shift"]),
          key("q", "8", "8", ["command", "shift"]),
          key("q", "9", "9", ["command", "shift"]),
          key("q", "0", "0", ["command", "shift"]),
          key("q", "spacebar", "x", ["shift", "option", "control"]), # google search selected text
        ].flatten,
  )
end

def wkey()
  puts JSON.pretty_generate(
        'description' => 'w - apps',
        'manipulators' => [
            shell('w', 'k', km("open: safari")),
            shell('w', 'a', km("open: dash")),
            shell('w', 'i', km("open: firefox dev")),
            shell('w', 'n', km("open: bee")),
            shell('w', 'h', km("open: xcode")),
            shell('w', 't', km("open: console")),
            shell('w', 'period', km("open: karabiner elements")),
            shell('w', 'comma', km("open: spotify")),
            shell('w', 'v', km("open: mindnode")),
            shell('w', 'c', km("open: script editor")),
            shell('w', 'b', km("open: bettertouchtool")),
            shell('w', 'r', km("open: fantastical")),
            shell('w', 'e', km("open: trello")),
            shell('w', 'g', km("open: snippetslab")),
            shell('w', 'f', km("open: 2do")),
            shell('w', 'j', km("open: iterm")),
            shell('w', 'l', km("open: sublime text")),
            shell('w', 'semicolon', km("open: vs code")),
            shell('w', 'o', km("open: keyboard maestro")),
        ].flatten,
  )
end

def ekey()
  puts JSON.pretty_generate(
        'description' => 'e - cmd',
        'manipulators' => [
          key("e", "return_or_enter", "return_or_enter", ["command"]),
          key("e", "escape", "escape", ["command"]),
          key("e", "delete_or_backspace", "delete_or_backspace", ["command"]),
          key("e", "delete_forward", "delete_forward", ["command"]),
          key("e", "tab", "tab", ["command"]),
          key("e", "spacebar", "spacebar", ["command"]),
          key("e", "hyphen", "hyphen", ["command"]),
          key("e", "equal_sign", "equal_sign", ["command"]),
          key("e", "open_bracket", "open_bracket", ["command"]),
          key("e", "close_bracket", "close_bracket", ["command"]),
          key("e", "backslash", "backslash", ["command"]),
          key("e", "non_us_pound", "non_us_pound", ["command"]),
          key("e", "semicolon", "semicolon", ["command"]),
          key("e", "quote", "quote", ["command"]),
          key("e", "grave_accent_and_tilde", "grave_accent_and_tilde", ["command"]),
          key("e", "comma", "comma", ["command"]),
          key("e", "period", "period", ["command"]),
          key("e", "comma", "comma", ["command"]),
          key("e", "period", "period", ["command"]),
          key("e", "slash", "slash", ["command"]),
          key("e", "non_us_backslash", "non_us_backslash", ["command"]),
          key("e", "slash", "slash", ["command"]),
          key("e", "non_us_backslash", "non_us_backslash", ["command"]),
          key("e", "a", "a", ["command"]),
          key("e", "b", "b", ["command"]),
          key("e", "c", "c", ["command"]),
          key("e", "d", "d", ["command"]),
          key("e", "f", "f", ["command"]),
          key("e", "g", "g", ["command"]),
          key("e", "h", "h", ["command"]),
          key("e", "i", "i", ["command"]),
          key("e", "j", "j", ["command"]),
          key("e", "k", "k", ["command"]),
          key("e", "l", "l", ["command"]),
          key("e", "m", "m", ["command"]),
          key("e", "n", "n", ["command"]),
          key("e", "o", "o", ["command"]),
          key("e", "p", "p", ["command"]),
          key("e", "q", "q", ["command"]),
          key("e", "r", "r", ["command"]),
          key("e", "s", "s", ["command"]),
          key("e", "t", "t", ["command"]),
          key("e", "u", "u", ["command"]),
          key("e", "v", "v", ["command"]),
          key("e", "w", "w", ["command"]),
          key("e", "x", "x", ["command"]),
          key("e", "y", "y", ["command"]),
          key("e", "z", "z", ["command"]),
          key("e", "1", "1", ["command"]),
          key("e", "2", "2", ["command"]),
          key("e", "3", "3", ["command"]),
          key("e", "4", "4", ["command"]),
          key("e", "5", "5", ["command"]),
          key("e", "6", "6", ["command"]),
          key("e", "7", "7", ["command"]),
          key("e", "8", "8", ["command"]),
          key("e", "9", "9", ["command"]),
          key("e", "0", "0", ["command"]),
        ].flatten,
  )
end

def rkey()
  puts JSON.pretty_generate(
        'description' => 'r - apps',
        'manipulators' => [
          #key('r', 'space', 's', ["shift", "control"]), # web searches with selected text
          shell('r', '1', km('open: hazel')),
          shell('r', 'u', km('open: actual')),
          shell('r', 'l', km('open: ulysses')),
          shell('semicolon', 'semicolon', km('open: paw')),
          shell('r', 'slash', km('open: little snitch configuration')),
          shell('r', 'tab', km('open: flume')),
          shell('r', 't', km('open: transmission')),
          shell('r', 'p', km('open: paprika recipe manager')),
          shell('r', 'b', km('edit: edit keyboard shortcuts')),
          shell('r', 'comma', km('open: day one')),
          shell('r', 'm', km('open: marked')),
          shell('r', 'caps_lock', km('open: magic number')),
          shell('r', 's', km('open: itunes')),
          shell('r', 'a', km('open: alfred preferences')),
          shell('r', 'i', km('open: pixave')),
          shell('r', 'e', km('open: reeder')),
          shell('r', 'j', km('open: dictionary')),
          shell('r', 'h', km('open: hammerspoon')),
          shell('r', 'k', km('open: pdf expert')),
          shell('r', 'w', km('open: 1password')),
          shell('r', 'v', km('open: keychain access')),
          shell('r', 'n', km('open: timing')),
         # key("r", "o", "f10", ["option"], ["control"]), # open typinator
        ].flatten,
  )
end

def tkey()
  puts JSON.pretty_generate(
        'description' => 't - handy actions',
        'manipulators' => [
          shell('t', 'i', km('g: new snippetslab snippet')),
          shell('t', 'o', km('g: new mindnode file')),
          shell('t', 'j', km('g: goto km group of current app')),
          shell('t', 'k', km('g: goto km group of current app from picklist')),
          key("t", "spacebar", "r", ["shift", "option", "command"]), # google translate selected text
          shell("t", "period", km('g: stop all macros')),
          key("t", "s", "9", ["command", "control"]), # little snitch network monitor
          shell("t", "a", alfred('clean', 'nikivi.clean.folders')),
          shell("t", "y", alfred('gitUpdate', 'net.deanishe.alfred-git-repos')),
          shell('t', 'w', km('per: pass')),
        ].flatten,
  )
end

def ykey()
  puts JSON.pretty_generate(
        'description' => 'y - websites',
        'manipulators' => [
          shell('y', 'b', km('w: brilliant')),
          shell('y', 'd', km('w: pinboard')),
          shell('y', 'h', km('w: unsplash')),
        ].flatten,
  )
end

def ukey()
  puts JSON.pretty_generate(
        'description' => 'u - websites',
        'manipulators' => [
          shell('u', 'e', km('w: repl')),
          shell('u', 'd', km('w: codepen')),
          shell('u', 'a', km('w: arxiv')),
          shell('u', 'l', km('w: bitly')),
          shell('u', 'x', km('w: dropbox')),
          shell('u', 'v', km('w: twitch')),
          shell('u', 'b', km('w: gitbook')),
          shell('u', 'r', km('w: google drive')),
          shell('u', 'h', km('w: khan academy')),
          shell('u', 'spacebar', km('g: open url in safari')),
          shell('u', 't', km('w: github trending')),
          shell('u', 'z', km('w: MDN')),
          shell('u', 'y', km('w: netlify')),
          shell('u', 'g', km('w: kaggle')),
          shell('u', 'i', km('w: wakatime')),
          shell('u', 'w', km('w: AWS')),
          shell('u', 's', km('w: NPM')),
        ].flatten,
  )
end

# TODO: finish
def ikey()
  puts JSON.pretty_generate(
        'description' => 'i - symbols',
        'manipulators' => [
          key("i", "a", "slash", []),
        ].flatten,
  )
end

def okey()
  puts JSON.pretty_generate(
        'description' => 'o - alfred',
        'manipulators' => [
        ].flatten,
  )
end

def akey()
  puts JSON.pretty_generate(
        'description' => 'a - ctrl',
        'manipulators' => [
          key("a", "return_or_enter", "return_or_enter", ["control"]),
          key("a", "escape", "escape", ["control"]),
          key("a", "delete_or_backspace", "delete_or_backspace", ["control"]),
          key("a", "delete_forward", "delete_forward", ["control"]),
          key("a", "tab", "tab", ["control"]),
          key("a", "spacebar", "spacebar", ["control"]),
          key("a", "hyphen", "hyphen", ["control"]),
          key("a", "equal_sign", "equal_sign", ["control"]),
          key("a", "open_bracket", "open_bracket", ["control"]),
          key("a", "close_bracket", "close_bracket", ["control"]),
          key("a", "backslash", "backslash", ["control"]),
          key("a", "non_us_pound", "non_us_pound", ["control"]),
          key("a", "semicolon", "semicolon", ["control"]),
          key("a", "quote", "quote", ["control"]),
          key("a", "grave_accent_and_tilde", "grave_accent_and_tilde", ["control"]),
          key("a", "comma", "comma", ["control"]),
          key("a", "period", "period", ["control"]),
          key("a", "comma", "comma", ["control"]),
          key("a", "period", "period", ["control"]),
          key("a", "slash", "slash", ["control"]),
          key("a", "non_us_backslash", "non_us_backslash", ["control"]),
          key("a", "slash", "slash", ["control"]),
          key("a", "non_us_backslash", "non_us_backslash", ["control"]),
          key("a", "b", "b", ["control"]),
          key("a", "c", "c", ["control"]),
          key("a", "d", "d", ["control"]),
          key("a", "e", "e", ["control"]),
          key("a", "f", "f", ["control"]),
          key("a", "g", "g", ["control"]),
          key("a", "h", "h", ["control"]),
          key("a", "i", "i", ["control"]),
          key("a", "j", "j", ["control"]),
          key("a", "k", "k", ["control"]),
          key("a", "l", "l", ["control"]),
          key("a", "m", "m", ["control"]),
          key("a", "n", "n", ["control"]),
          key("a", "o", "o", ["control"]),
          key("a", "p", "p", ["control"]),
          key("a", "q", "q", ["control"]),
          key("a", "r", "r", ["control"]),
          key("a", "s", "s", ["control"]),
          key("a", "t", "t", ["control"]),
          key("a", "u", "u", ["control"]),
          key("a", "v", "v", ["control"]),
          key("a", "w", "w", ["control"]),
          key("a", "x", "x", ["control"]),
          key("a", "y", "y", ["control"]),
          key("a", "z", "z", ["control"]),
          key("a", "1", "1", ["control"]),
          key("a", "2", "2", ["control"]),
          key("a", "3", "3", ["control"]),
          key("a", "4", "4", ["control"]),
          key("a", "5", "5", ["control"]),
          key("a", "6", "6", ["control"]),
          key("a", "7", "7", ["control"]),
          key("a", "8", "8", ["control"]),
          key("a", "9", "9", ["control"]),
          key("a", "0", "0", ["control"]),
        ].flatten,
  )
end

def skey()
  puts JSON.pretty_generate(
        'description' => 's - essential',
        'manipulators' => [
          key("s", "i", "spacebar", ["control"]), # contexts window search
          key("s", "o", "9", ["control", "command", "option"]), # contexts window search
          key("s", "d", "delete_or_backspace", []),
          key("s", "f", "return_or_enter", []),
          key("s", "v", "", ["shift"]),
          key("s", "g", "tab", ["command"]),
          key("s", "h", "left_arrow", []),
          key("s", "j", "down_arrow", []),
          key("s", "k", "up_arrow", []),
          key("s", "l", "right_arrow", []),
        ].flatten,
  )
end

def fkey()
  puts JSON.pretty_generate(
        'description' => 'f - essential',
        'manipulators' => [
          key("f", "e", "8", ["option", "command"]), # alfred clipboard history search 
          key("f", "k", "return_or_enter", []), # alfred clipboard history search 
        ].flatten,
  )
end

def zkey()
  puts JSON.pretty_generate(
        'description' => 'z - chat',
        'manipulators' => [
            shell("z", "k", km('open: Telegram')),
            shell("z", "j", km('open: Textual')),
        ].flatten,
  )
end

def nkey()
  puts JSON.pretty_generate(
        'description' => 'n - alfred',
        'manipulators' => [
            shell("n", "s", alfred('search', 'nikivi.web.searches')),
            shell("n", "f", alfred('github', 'me.lachlan.githubjump')),
        ].flatten,
  )
end

main
