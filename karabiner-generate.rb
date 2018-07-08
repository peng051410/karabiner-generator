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
            launcher('k',[],[{'shell_command' => km("open: safari")}], 'w'),
            launcher('j',[],[{'shell_command' => alfred("google", "net.deanishe.alfred-searchio.old")}], 'w')
        ].flatten,
  )
end

def sticky_s()
  puts JSON.pretty_generate(
        'description' => 'gen: sticky s - essential',
        'manipulators' => [
          key_to_key('f', 'return_or_enter'),
          key_to_key('j', 'down_arrow'),
          key_to_key('k', 'up_arrow'),
          key_to_key('h', 'left_arrow'),
          key_to_key('l', 'right_arrow'),
        ].flatten,
  )
end

def key_to_key(from_key_code, to_key_code)
  [
    {
      'type' => 'basic',
      'from' => {
        'key_code' => from_key_code,
        'modifiers' => Karabiner.from_modifiers(nil, ['any']),
      },
      'to' => [
        {
          'key_code' => to_key_code,
        },
      ],
      'conditions' => [
        {
          'type' => 'variable_if',
          'name' => 'key_to_key',
          'value' => 1,
        },
      ],
    },
    {
      'type' => 'basic',
      'from' => {
        'simultaneous' => [
          { 'key_code' => 's' },
          { 'key_code' => from_key_code },
        ],
        'simultaneous_options' => {
          'key_down_order' => 'strict',
          'key_up_order' => 'strict_inverse',
          'to_after_key_up' => [
            Karabiner.set_variable('key_to_key', 0),
          ],
        },
        'modifiers' => Karabiner.from_modifiers(nil, ['any']),
      },
      'to' => [
        Karabiner.set_variable('key_to_key', 1),
        {
          'key_code' => to_key_code,
        },
      ],
      'parameters' => {
        'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
      },
    },
  ]
end

def sticky(sticky_key, action_key, action)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => action_key,
      'modifiers' => Karabiner.from_modifiers(mandatory_modifiers, ['any']),
    },
    'to' => to,
    'conditions' => [Karabiner.variable_if('launcher', 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => trigger_key },
        { 'key_code' => from_key_code },
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'strict_inverse',
        'to_after_key_up' => [
          Karabiner.set_variable('launcher', 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers(mandatory_modifiers, ['any']),
    },
    'to' => [
      Karabiner.set_variable('launcher', 1),
    ].concat(to),
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

def launcher_with_modifs(from_key_code, mandatory_modifiers, to, trigger_key)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => from_key_code,
      'modifiers' => Karabiner.from_modifiers(mandatory_modifiers, ['any']),
    },
    'to' => to,
    'conditions' => [Karabiner.variable_if('launcher', 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => trigger_key },
        { 'key_code' => from_key_code },
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'strict_inverse',
        'to_after_key_up' => [
          Karabiner.set_variable('launcher', 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers(mandatory_modifiers, ['any']),
    },
    'to' => [
      Karabiner.set_variable('launcher', 1),
    ].concat(to),
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

main
