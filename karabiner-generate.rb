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
        'description' => 'gen: shell w - apps',
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
            shell('w', 'p', alfred('google','net.deanishe.alfred-searchio.old')),
        ].flatten,
  )
end

def sticky_s()
  puts JSON.pretty_generate(
        'description' => 'gen: shell s - essential',
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

def sticky_q()
  puts JSON.pretty_generate(
        'description' => 'gen: shell q - cmd + shift',
        'manipulators' => [
          key("q", "w", "w", ["command", "shift"]),
          key("q", "t", "t", ["command", "shift"]),
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
