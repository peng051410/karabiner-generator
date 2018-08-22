require 'json'
require_relative 'helper.rb'

# Parameters
PARAMETERS = {
  :simultaneous_threshold_milliseconds => 500,
}.freeze

def shell(held_key, trigger_key, shell_command)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => trigger_key,
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
     'shell_command' => shell_command,
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
      'shell_command' => shell_command,
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
      'modifiers' => to_modifiers,
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

def simkey(first_key, second_key, key_code, to_modifiers)
  data = []

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => first_key},
        { 'key_code' => second_key},
      ],
    },
    'to' => [
     'key_code' => key_code,
     'modifiers' => to_modifiers,
    ],
  }

  data << h

end

def simshell(first_key, second_key, shell_command)
  data = []

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => first_key},
        { 'key_code' => second_key},
      ],
    },
    'to' => [
        'shell_command' => shell_command 
    ],
  }

  data << h

end

# TODO: add moving mouse
def scroll(held_key, trigger_key, direction, amount)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => trigger_key,
      'modifiers' => Karabiner.from_modifiers([], ['any']),
    },
    'to' => [
      'mouse_key' => {
        "#{direction}": amount
      },
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
      'mouse_key' => {
        "#{direction}": amount
      },
    ],
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

# TODO: add ability to generate and easily modify global settings
def globalOptions()
  data = []

  h = {

  }

end

# TODO: add ability to generate devices
def devices()

end

# TODO: add ability to configure what FN keys do
def fnKeys()

end

# TODO: add ability to create profiles
def profiles()

end

def km(macro)
    "osascript -e 'tell application \"Keyboard Maestro Engine\" to do script \"" + macro + "\"'"
end

def alfred(trigger, workflow)
    "osascript -e 'tell application \"Alfred 3\" to run trigger \"" + trigger + "\" in workflow \"" + workflow + "\" with argument \"\"'"
end
