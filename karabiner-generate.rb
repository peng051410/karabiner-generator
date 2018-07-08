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
    sticky_w()
    puts ','
    sticky_s()
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
            sticky('w', 'caps_lock', km("open: finder")),
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

def sticky(sticky_key, action_key, action, modifiers=nil)
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
      'key_code' => action_key,
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => action,
    'conditions' => [Karabiner.variable_if('launcher', 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => sticky_key},
        { 'key_code' => action_key },
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
      Karabiner.set_variable('launcher', 1),
    ].concat(action),
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

main
