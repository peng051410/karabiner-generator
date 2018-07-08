#!/usr/bin/env ruby

# Parameters
PARAMETERS = {
  :simultaneous_threshold_milliseconds => 500,
}.freeze

############################################################

require 'json'
require_relative 'karabiner.rb'

def km(macro)
    "osascript -e 'tell application \"Keyboard Maestro Engine\" do script \"" + macro + "\"'"
end

def alfred(trigger, workflow)
    "osascript -e 'tell application \"Alfred 3\" to run trigger \"" + trigger + "\" in workflow \"" + workflow + "\" with argument \"\"'"
end

def main
  sticky_q()
end

def swapkeys()
    puts JSON.pretty_generate(
        'description' => 'swap keys',
        'manipulators' => [
            swapkey("semicolon", "semicolon", nil, ["caps_lock"], ["left_shift"]),
            swapkey("semicolon", "semicolon", ["shift"], ['any'], nil), # shift + : -> ;
        ].flatten,
  )

end

def sticky_w()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky w - apps',
        'manipulators' => [
            sticky('w', 'k', km("open: safari")),
            sticky('w', 'i', km("open: chrome")),
            sticky('w', 'n', km("open: bee")),
            sticky('w', 'h', km("open: xcode")),
            sticky('w', 't', km("open: console")),
            sticky('w', 'period', km("open: karabiner elements")),
            sticky('w', 'comma', km("open: spotify")),
            sticky('w', 'v', km("open: mindnode")),
            sticky('w', 'b', km("open: bettertouchtool")),
            sticky('w', 'r', km("open: fantastical")),
            sticky('w', 'e', km("open: trello")),
            sticky('w', 'g', km("open: snippetslab")),
            sticky('w', 'f', km("open: 2do")),
            sticky('w', 'j', km("open: iterm")),
            sticky('w', 'l', km("open: sublime text")),
            sticky('w', 'semicolon', km("open: vs code")),
            sticky('w', 'o', km("open: keyboard maestro")),
        ].flatten,
  )
end

def sticky_s()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky s - essential',
        'manipulators' => [
          sticky('s', 'f', 'return_or_enter'),
          sticky('s', 'j', 'down_arrow'),
          sticky('s', 'k', 'up_arrow'),
          sticky('s', 'h', 'left_arrow'),
          sticky('s', 'l', 'right_arrow'),
          sticky('s', 'l', 'right_arrow'),
          sticky('s', 'm', 'right_arrow', 'left_command'),
        ].flatten,
  )
end

def sticky_q()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky q - cmd + shift',
        'manipulators' => [
          sticky("q", "w", "w", [], ["command", "shift"]),
          sticky("q", "k", alfred("google", "net.deanishe.alfred-searchio.old")),
        ].flatten,
  )
end

def sticky(held_key, trigger_key, action, mandotary_modifiers=[], to_modifiers=[])
  if action.start_with? 'osascript'
    action = [{'shell_command' => action}]
  else
      action = [{'key_code' => action}]
  end

  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => trigger_key,
      'modifiers' => Karabiner.from_modifiers(mandotary_modifiers, ['any']),
    },
    'to' => action,
    'modifiers' => to_modifiers,
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
          Karabiner.set_variable('launcher', 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
      Karabiner.set_variable(held_key, 1),
    ].concat(action),
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
