#!/usr/bin/env ruby

# Parameters
PARAMETERS = {
  :simultaneous_threshold_milliseconds => 500,
}.freeze

require 'json'
require_relative 'karabiner.rb'

def km(macro)
    "osascript -e 'tell application \"Keyboard Maestro Engine\" do script \"" + macro + "\"'"
end

def alfred(trigger, workflow)
    "osascript -e 'tell application \"Alfred 3\" to run trigger \"" + trigger + "\" in workflow \"" + workflow + "\" with argument \"\"'"
end

def main
  sticky_i()
end

# TODO: alphabetize all manipulators based on trigger key. can use vim magic for it

# TODO: add HS calls. do it in background
# hammerspoon://openConsole -> opens console
# hammerspoon://showTime -> shows time
# hammerspoon://reloadConfig -> reloads HS
# hammerspoon://test -> tests some HS func

# SMALL BINDS

def swapkeys()
    puts JSON.pretty_generate(
        'description' => 'swap keys',
        'manipulators' => [
            swapkey("semicolon", "semicolon", nil, ["caps_lock"], ["left_shift"]), # ; -> :
            swapkey("semicolon", "semicolon", ["shift"], ['any'], nil), # shift + : -> ;
        ].flatten,
  )
end

# STICKY KEY DEFINITIONS

def sticky_q()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky q - cmd + shift',
        'manipulators' => [
          key("q", "w", "w", ["command", "shift"]),
          key("q", "e", "e", ["command", "shift"]),
          key("q", "r", "r", ["command", "shift"]),
          key("q", "t", "t", ["command", "shift"]),
          key("q", "y", "y", ["command", "shift"]),
          key("q", "u", "u", ["command", "shift"]),
          key("q", "i", "i", ["command", "shift"]),
          key("q", "o", "o", ["command", "shift"]),
          key("q", "p", "p", ["command", "shift"]),
          key("q", "a", "a", ["command", "shift"]),
          key("q", "s", "s", ["command", "shift"]),
          key("q", "d", "d", ["command", "shift"]),
          key("q", "f", "f", ["command", "shift"]),
          key("q", "g", "g", ["command", "shift"]),
          key("q", "h", "h", ["command", "shift"]),
          key("q", "j", "j", ["command", "shift"]),
          key("q", "k", "k", ["command", "shift"]),
          key("q", "l", "l", ["command", "shift"]),
          key("q", "z", "z", ["command", "shift"]),
          key("q", "x", "x", ["command", "shift"]),
          key("q", "c", "c", ["command", "shift"]),
          key("q", "v", "v", ["command", "shift"]),
          key("q", "b", "b", ["command", "shift"]),
          key("q", "n", "n", ["command", "shift"]),
          key("q", "m", "m", ["command", "shift"]),
          key("q", "1", "1", ["command", "shift"]),
          key("q", "2", "2", ["command", "shift"]),
          key("q", "3", "3", ["command", "shift"]),
          key("q", "4", "4", ["command", "shift"]),
          key("q", "5", "5", ["command", "shift"]),
          key("q", "6", "6", ["command", "shift"]),
          key("q", "7", "7", ["command", "shift"]),
          key("q", "8", "8", ["command", "shift"]),
          key("q", "9", "9", ["command", "shift"]),
          key("q", "spacebar", "x", ["shift", "option", "control"]), # google search selected text
        ].flatten,
  )
end

# TODO: finish
def sticky_w()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky w - apps',
        'manipulators' => [
            shell('w', 'k', km("open: safari")),
            shell('w', 'i', km("open: chrome")),
            shell('w', 'n', km("open: bee")),
            shell('w', 'h', km("open: xcode")),
            shell('w', 't', km("open: console")),
            shell('w', 'period', km("open: karabiner elements")),
            shell('w', 'comma', km("open: spotify")),
            shell('w', 'v', km("open: mindnode")),
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

def sticky_e()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky e - cmd',
        'manipulators' => [
            key("e", "q", "q", ["command"]),
            key("e", "w", "w", ["command"]),
            key("e", "r", "r", ["command"]),
            key("e", "t", "t", ["command"]),
            key("e", "y", "y", ["command"]),
            key("e", "u", "u", ["command"]),
            key("e", "i", "i", ["command"]),
            key("e", "o", "o", ["command"]),
            key("e", "p", "p", ["command"]),
            key("e", "a", "a", ["command"]),
            key("e", "s", "s", ["command"]),
            key("e", "d", "d", ["command"]),
            key("e", "f", "f", ["command"]),
            key("e", "g", "g", ["command"]),
            key("e", "h", "h", ["command"]),
            key("e", "j", "j", ["command"]),
            key("e", "k", "k", ["command"]),
            key("e", "l", "l", ["command"]),
            key("e", "z", "z", ["command"]),
            key("e", "x", "x", ["command"]),
            key("e", "c", "c", ["command"]),
            key("e", "v", "v", ["command"]),
            key("e", "b", "b", ["command"]),
            key("e", "n", "n", ["command"]),
            key("e", "m", "m", ["command"]),
            key("e", "comma", "comma", ["command"]),
            key("e", "period", "period", ["command"]),
        ].flatten,
  )
end

def sticky_r()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky r - apps',
        'manipulators' => [
          key('r', 'space', 's', ["shift", "control"]), # web searches with selected text
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
          key("r", "o", "f10", ["option"], ["control"]), # open typinator
        ].flatten,
  )
end

def sticky_t()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky t - handy actions',
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

def sticky_y()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky y - websites',
        'manipulators' => [
          shell('y', 'b', km('w: brilliant')),
          shell('y', 'd', km('w: pinboard')),
          shell('y', 'h', km('w: unsplash')),
        ].flatten,
  )
end

def sticky_u()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky u - websites',
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
def sticky_i()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky ',
        'manipulators' => [
            multiple_key("i", "b", 'v', 'o', ["shift"], ['shift'])
        ].flatten,
  )
end

# TODO: fix!
def sticky_s()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky s - essential',
        'manipulators' => [
          shell('s', 'f', 'return_or_enter'),
          shell('s', 'j', 'down_arrow'),
          shell('s', 'k', 'up_arrow'),
          shell('s', 'h', 'left_arrow'),
          shell('s', 'l', 'right_arrow'),
          shell('s', 'l', 'right_arrow'),
          shell('s', 'm', 'right_arrow', 'left_command'),
        ].flatten,
  )
end

def shell(held_key, trigger_key, action)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => trigger_key,
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
     'shell_command' => action,
    ],
    'conditions' => [Karabiner.variable_if(held_key, 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => held_key},
        { 'key_code' => trigger_key},
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'strict_inverse',
        'to_after_key_up' => [
          Karabiner.set_variable(held_key, 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
      Karabiner.set_variable(held_key, 1),
      'shell_command' => action,
    ],
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

def key(held_key, trigger_key, key_code, to_modifiers=[])
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => trigger_key,
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
     'key_code' => key_code,
     'modifiers' => to_modifiers,
    ],
    'conditions' => [Karabiner.variable_if(held_key, 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => held_key},
        { 'key_code' => trigger_key},
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'strict_inverse',
        'to_after_key_up' => [
          Karabiner.set_variable(held_key, 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
      Karabiner.set_variable(held_key, 1),
      'key_code' => key_code,
    ],
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

def swapkey(from_key, to_key, mandotary_modifiers=nil, optional_modifiers=['any'], to_modifiers=nil)
  data = []

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => from_key,
      'modifiers' => Karabiner.from_modifiers(mandotary_modifiers, optional_modifiers),
    },
    'to' => [
     'key_code' => to_key,
     'modifiers' => to_modifiers,
    ]
  }

  data << h

end

main
