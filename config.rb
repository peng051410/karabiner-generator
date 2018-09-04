#!/usr/bin/env ruby
require_relative 'karabiner.rb'

# TODO: add HS calls. do it in background
# hammerspoon://openConsole -> opens console
# hammerspoon://reloadConfig -> reloads HS
# hammerspoon://test -> tests some HS func

def swapkeys()
  JSON.pretty_generate(
    'description' => 'swap keys',
    'manipulators' => [
      swapkey('semicolon', 'semicolon', nil, ['caps_lock'], ['left_shift']), # ; -> :
      swapkey('semicolon', 'semicolon', ['shift'], ['any'], nil), # shift + : -> ;
    ].flatten,
  )
end

def simj()
  JSON.pretty_generate(
    'description' => 'j',
    'manipulators' => [
      simshell('j', 'k', alfred('search google', 'net.deanishe.alfred-searchio')),
      simshell('j', 'semicolon', alfred('search tabs', 'net.deanishe.alfred.safari')),
      simshell('j', 'spacebar',km('Get current URL from Safari')),
      simkey('j', 'l', 'spacebar', ['command']), # Alfred
    ].flatten,
  )
end

def simk()
  JSON.pretty_generate(
    'description' => 'k',
    'manipulators' => [
      simshell('k', 'l', alfred('search dash', 'com.nikivi.own.dash')),
    ].flatten,
  )
end

# TODO: sim keys don't work properly. Like l + m together. Commented out means not working but I want it to work.
# I think its due to how other binding JSON is being generated.
def siml()
  JSON.pretty_generate(
    'description' => 'l',
    'manipulators' => [
      #simshell('l', 'm', alfred('search bookmarks', 'net.deanishe.alfred.safari')),
    ].flatten,
  )
end

# TODO: doesnt work!
def simspacebar()
  JSON.pretty_generate(
    'description' => 'spacebar',
    'manipulators' => [
      simshell('spacebar', 'i', alfred('search google images', 'net.deanishe.alfred-searchio')),
    ].flatten,
  )
end

def colonkey()
  JSON.pretty_generate(
    'description' => 'colon (shift)',
    'manipulators' => [
      key('semicolon', 'q', 'q', ['shift']),
      key('semicolon', 'w', 'w', ['shift']),
      key('semicolon', 'e', 'e', ['shift']),
      key('semicolon', 'r', 'r', ['shift']),
      key('semicolon', 't', 't', ['shift']),
      key('semicolon', 'y', 'y', ['shift']),
      key('semicolon', 'u', 'u', ['shift']),
      key('semicolon', 'u', 'u', ['shift']),
      key('semicolon', 'i', 'i', ['shift']),
      key('semicolon', 'o', 'o', ['shift']),
      key('semicolon', 'p', 'p', ['shift']),
      key('semicolon', 'a', 'a', ['shift']),
      key('semicolon', 's', 's', ['shift']),
      key('semicolon', 'd', 'd', ['shift']),
      key('semicolon', 'f', 'f', ['shift']),
      key('semicolon', 'g', 'g', ['shift']),
      key('semicolon', 'h', 'h', ['shift']),
      key('semicolon', 'j', 'j', ['shift']),
      key('semicolon', 'k', 'k', ['shift']),
      key('semicolon', 'l', 'l', ['shift']),
      key('semicolon', 'z', 'z', ['shift']),
      key('semicolon', 'x', 'x', ['shift']),
      key('semicolon', 'c', 'c', ['shift']),
      key('semicolon', 'v', 'v', ['shift']),
      key('semicolon', 'b', 'b', ['shift']),
      key('semicolon', 'n', 'n', ['shift']),
      key('semicolon', 'm', 'm', ['shift']),
      key('semicolon', '1', '1', ['control']),
      key('semicolon', '2', '2', ['control']),
      key('semicolon', '3', '3', ['control']),
      key('semicolon', '4', '4', ['control']),
      key('semicolon', '5', '5', ['control']),
      key('semicolon', '6', '6', ['control']),
    ].flatten,
  )
end

def qkey()
  JSON.pretty_generate(
    'description' => 'q (cmd + shift)',
    'manipulators' => [
      key('q', 'open_bracket', 'open_bracket', ['command', 'shift']),
      key('q', 'close_bracket', 'close_bracket', ['command', 'shift']),
      key('q', 'semicolon', 'semicolon', ['command', 'shift']),
      key('q', 'quote', 'quote', ['command', 'shift']),
      key('q', 'comma', 'comma', ['command', 'shift']),
      key('q', 'period', 'period', ['command', 'shift']),
      key('q', 'slash', 'slash', ['command', 'shift']),
      key('q', 'a', 'a', ['command', 'shift']),
      key('q', 'b', 'b', ['command', 'shift']),
      key('q', 'c', 'c', ['command', 'shift']),
      key('q', 'd', 'd', ['command', 'shift']),
      key('q', 'e', 'e', ['command', 'shift']),
      key('q', 'f', 'f', ['command', 'shift']),
      key('q', 'g', 'g', ['command', 'shift']),
      key('q', 'h', 'h', ['command', 'shift']),
      key('q', 'i', 'i', ['command', 'shift']),
      key('q', 'j', 'j', ['command', 'shift']),
      key('q', 'k', 'k', ['command', 'shift']),
      key('q', 'l', 'l', ['command', 'shift']),
      key('q', 'm', 'm', ['command', 'shift']),
      key('q', 'n', 'n', ['command', 'shift']),
      key('q', 'o', 'o', ['command', 'shift']),
      key('q', 'p', 'p', ['command', 'shift']),
      key('q', 'r', 'r', ['command', 'shift']),
      key('q', 's', 's', ['command', 'shift']),
      key('q', 't', 't', ['command', 'shift']),
      key('q', 'u', 'u', ['command', 'shift']),
      key('q', 'v', 'v', ['command', 'shift']),
      key('q', 'w', 'w', ['command', 'shift']),
      key('q', 'x', 'x', ['command', 'shift']),
      key('q', 'y', 'y', ['command', 'shift']),
      key('q', 'z', 'z', ['command', 'shift']),
      key('q', '1', '1', ['command', 'shift']),
      key('q', '2', '2', ['command', 'shift']),
      key('q', '3', '3', ['command', 'shift']),
      key('q', '4', '4', ['command', 'shift']),
      key('q', '5', '5', ['command', 'shift']),
      key('q', '6', '6', ['command', 'shift']),
      key('q', '7', '7', ['command', 'shift']),
      key('q', '8', '8', ['command', 'shift']),
      key('q', '9', '9', ['command', 'shift']),
      key('q', '0', '0', ['command', 'shift']),
      key('q', 'spacebar', 'x', ['shift', 'option', 'control']), # google search selected text
    ].flatten,
  )
end

def wkey()
  JSON.pretty_generate(
    'description' => 'w (apps)',
    'manipulators' => [
      shell('w', 'k', km('open: Safari')),
      shell('w', 'a', km('open: Dash')),
      shell('w', 'i', km('open: Chrome')),
      shell('w', 'n', km('open: Bee')),
      shell('w', 't', km('open: Console')),
      shell('w', 'comma', km('open: Spotify')),
      shell('w', 'caps_lock', km('open: Finder')),
      shell('w', 'm', km('open: Tower')),
      shell('w', 'b', km('open: BetterTouchTool')),
      shell('w', 'r', km('open: Fantastical')),
      shell('w', 'e', km('open: Trello')),
      shell('w', 'h', km('open: Xcode')),
      shell('w', 'g', km('open: SnippetsLab')),
      shell('w', 'f', km('open: 2do')),
      shell('w', 'j', km('open: iTerm')),
      shell('w', 'l', km('open: Sublime Text')),
      shell('w', 'semicolon', km('open: VS Code')),
      shell('w', 'o', km('open: Keyboard Maestro')),
    ].flatten,
  )
end

def ekey()
  JSON.pretty_generate(
    'description' => 'e (cmd)',
    'manipulators' => [
      # key('e', 'spacebar', 'spacebar', ['command']), # TODO: change. look at private.xml
      key('e', 'open_bracket', 'open_bracket', ['command']),
      key('e', 'close_bracket', 'close_bracket', ['command']),
      key('e', 'semicolon', 'semicolon', ['command']),
      key('e', 'quote', 'quote', ['command']),
      key('e', 'comma', 'comma', ['command']),
      key('e', 'period', 'period', ['command']),
      key('e', 'slash', 'slash', ['command']),
      key('e', 'a', 'a', ['command']),
      key('e', 'b', 'b', ['command']),
      key('e', 'c', 'c', ['command']),
      key('e', 'd', 'd', ['command']),
      key('e', 'f', 'f', ['command']),
      key('e', 'g', 'g', ['command']),
      key('e', 'h', 'h', ['command']),
      key('e', 'i', 'i', ['command']),
      key('e', 'j', 'j', ['command']),
      key('e', 'k', 'k', ['command']),
      key('e', 'l', 'l', ['command']),
      key('e', 'm', 'm', ['command']),
      key('e', 'n', 'n', ['command']),
      key('e', 'o', 'o', ['command']),
      key('e', 'p', 'p', ['command']),
      key('e', 'q', 'q', ['command']),
      key('e', 'r', 'r', ['command']),
      key('e', 's', 's', ['command']),
      key('e', 't', 't', ['command']),
      key('e', 'u', 'u', ['command']),
      key('e', 'v', 'v', ['command']),
      key('e', 'w', 'w', ['command']),
      key('e', 'x', 'x', ['command']),
      key('e', 'y', 'y', ['command']),
      key('e', 'z', 'z', ['command']),
      key('e', '1', '1', ['command']),
      key('e', '2', '2', ['command']),
      key('e', '3', '3', ['command']),
      key('e', '4', '4', ['command']),
      key('e', '5', '5', ['command']),
      key('e', '6', '6', ['command']),
      key('e', '7', '7', ['command']),
      key('e', '8', '8', ['command']),
      key('e', '9', '9', ['command']),
      key('e', '0', '0', ['command']),
      #alfred('e', 'caps_lock', alfred('make screenshot', 'com.vitorgalvao.alfred.webscreenshot')), # Make imgur screenshot. TODO: doesnt work
    ].flatten,
  )
end

def rkey()
  JSON.pretty_generate(
    'description' => 'r (apps)',
    'manipulators' => [
      #key('r', 'space', 's', ['shift', 'control']), # web searches with selected text
      shell('r', 'u', km('open: Actual')),
      shell('r', 'l', km('open: Ulysses')),
      shell('r', 't', km('open: Transmission')),
      shell('r', 'p', km('open: Paprika Recipe Manager')),
      shell('r', 'b', km('Edit keyboard shortcuts')),
      #shell('r', 'm', km('open: Marked')),
      shell('r', 'a', km('open: Alfred Preferences')),
      shell('r', 'i', km('open: Pixave')),
      shell('r', 'e', km('open: Reeder')),
      shell('r', 'j', km('open: Dictionary')),
      shell('r', 'k', km('open: PDF Expert')),
      shell('r', 'w', km('open: 1Password')),
      shell('r', 'n', km('open: Timing')),
      shell('r', 'o', km('open: Affinity Designer')),
      # key('r', 'o', 'f10', ['option'], ['control']), # open typinator
    ].flatten,
  )
end

def tkey()
  JSON.pretty_generate(
    'description' => 't (handy actions)',
    'manipulators' => [
      shell('t', 'k', km('Go to KM group of current app from picklist')),
      shell('t', 'j', km('Go to KM group of current app')),
      key('t', 'spacebar', 'r', ['shift', 'option', 'command']), # Google translate selected text
      key('t', 's', 'x', ['command', 'control', 'option']), # Little Nnitch network monitor
      shell('t', 'a', alfred('trash desktop', 'nikivi.clean.folders')),
    ].flatten,
  )
end

def ykey()
  JSON.pretty_generate(
    'description' => 'y (websites)',
    'manipulators' => [
    ].flatten,
  )
end

def ukey()
  JSON.pretty_generate(
    'description' => 'u (websites)',
    'manipulators' => [
      shell('u', 'e', km('w: Repl')),
      shell('u', 'd', km('w: Codepen')),
      shell('u', 'a', km('w: Arxiv')),
      shell('u', 'x', km('w: Dropbox')),
      shell('u', 'v', km('w: Twitch')),
      shell('u', 'r', km('w: Google Drive')),
      shell('u', 'h', km('w: Khan Academy')),
      shell('u', 't', km('w: GitHub trending')),
      shell('u', 'z', km('w: MDN')),
      shell('u', 'y', km('w: Netlify')),
      shell('u', 'g', km('w: Kaggle')),
      shell('u', 'i', km('w: WakaTime')),
      shell('u', 'w', km('w: AWS')),
      shell('u', 's', km('w: NPM')),
    ].flatten,
  )
end

# TODO: finish
def ikey()
  JSON.pretty_generate(
    'description' => 'i (symbols)',
    'manipulators' => [
      key('i', 'q', 'open_bracket', ['shift']),
      key('i', 't', 'quote', []),
      key('i', 'r', 'quote', ['shift']),
      key('i', 'd', 'backslash', []),
      key('i', 'x', 'backslash', ['shift']),
      key('i', 'e', '3', ['shift']),
      key('i', '1', '1', ['shift']),
      key('i', '4', '8', ['shift']),
      key('i', 'semicolon', 'semicolon', []),
      key('i', '2', '2', ['shift']),
      key('i', 'f', 'hyphen', []),
      key('i', 's', 'hyphen', ['shift']),
      key('i', 'j', 'equal_sign', []),
      key('i', 'w', '9', ['shift']),
      key('i', 'g', '4', ['shift']),
      key('i', 'o', 'open_bracket', []),
      key('i', 'a', 'slash', []),
      key('i', 'z', 'slash', ['shift']),
      key('i', 'c', '7', ['shift']),
      key('i', '3', 'equal_sign', ['shift']),
      key('i', 'v', 'comma', ['shift']),
      shell('i', 'caps_lock', km('g: Match symbols')),
    ].flatten,
  )
end

def okey()
  JSON.pretty_generate(
    'description' => 'o (alfred)',
    'manipulators' => [
      key('o', '1','1',['command']),
      key('o', '2','2',['command']),
      key('o', '3','3',['command']),
      key('o', '4','4',['command']),
      key('o', '5','5',['command']),
      key('o', '6','6',['command']),
      key('o', 'w','backslash',['option','command']),
      shell('o', 'q',alfred('search downloads','recentdownloads.ddjfreedom')),
      shell('o', 't',km('2Do with current url as note (read)')),
      shell('o', 'a',alfred('search files','nikivi.manage.wiki')),
      shell('o', 'c',alfred('search emoji','com.github.jsumners.alfred-emoji')),
      shell('o', 'i',alfred('search tty sessions','net.isometry.alfred.tty')),
      shell('o', 'f',alfred('search repos','net.deanishe.alfred-git-repos')),
      shell('o', 'k',alfred('search lists','nikivi.learn.anything')),
      shell('o', 'g',alfred('search processes','com.vitorgalvao.alfred.processcontrol')),
      shell('o', 'j',alfred('search lists','nikivi.awesome.lists')),
      shell('o', 'v',alfred('search PDF files','nikivi.search.files')),
      shell('o', 'b',alfred('switch dash profile','nikivi.dash.profiles')),
      shell('o', 's',alfred('search clones','com.vitorgalvao.alfred.directories')),
      shell('o', 'd',alfred('search desktop','com.vitorgalvao.alfred.directories')),
      shell('o', 'caps_lock',alfred('search folders','nikivi.search.folders')),
      shell('o', 'z',alfred('search workflows','org.jeef.workflowdirectory')),
      shell('o', 'm',alfred('search menu bar','com.tedwise.menubarsearch')),
    ].flatten,
  )
end

def akey()
  JSON.pretty_generate(
    'description' => 'a (ctrl)',
    'manipulators' => [
      key('a', 'spacebar', '9', ['control', 'command']), # Google selection
      key('a', 'open_bracket', 'open_bracket', ['control']),
      key('a', 'close_bracket', 'close_bracket', ['control']),
      key('a', 'semicolon', 'semicolon', ['control']),
      key('a', 'quote', 'quote', ['control']),
      key('a', 'comma', 'comma', ['control']),
      key('a', 'period', 'period', ['control']),
      key('a', 'slash', 'slash', ['control']),
      key('a', 'b', 'b', ['control']),
      key('a', 'c', 'c', ['control']),
      key('a', 'd', 'd', ['control']),
      key('a', 'e', 'e', ['control']),
      key('a', 'f', 'f', ['control']),
      key('a', 'g', 'g', ['control']),
      key('a', 'h', 'h', ['control']),
      key('a', 'i', 'i', ['control']),
      key('a', 'j', 'j', ['control']),
      key('a', 'k', 'k', ['control']),
      key('a', 'l', 'l', ['control']),
      key('a', 'm', 'm', ['control']),
      key('a', 'n', 'n', ['control']),
      key('a', 'o', 'o', ['control']),
      key('a', 'p', 'p', ['control']),
      key('a', 'q', 'q', ['control']),
      key('a', 'r', 'r', ['control']),
      key('a', 's', 's', ['control']),
      key('a', 't', 't', ['control']),
      key('a', 'u', 'u', ['control']),
      key('a', 'v', 'v', ['control']),
      key('a', 'w', 'w', ['control']),
      key('a', 'x', 'x', ['control']),
      key('a', 'y', 'y', ['control']),
      key('a', 'z', 'z', ['control']),
      key('a', '1', '1', ['control']),
      key('a', '2', '2', ['control']),
      key('a', '3', '3', ['control']),
      key('a', '4', '4', ['control']),
      key('a', '5', '5', ['control']),
      key('a', '6', '6', ['control']),
      key('a', '7', '7', ['control']),
      key('a', '8', '8', ['control']),
      key('a', '9', '9', ['control']),
      key('a', '0', '0', ['control']),
    ].flatten,
  )
end

def skey()
  JSON.pretty_generate(
    'description' => 's (essential)',
    'manipulators' => [
      key('s', 'e', 'tab', []),
      key('s', 'r', 'tab', ['shift']),
      shell('s', 'semicolon', km('Add selected text as todo')),
      key('s', 'i', 'spacebar', ['control']), # contexts window search
      key('s', 'o', '9', ['control', 'command', 'option']), # typinator quick search
      key('s', 'a', 'c', ['command']),
      key('s', 'd', 'delete_or_backspace', []),
      key('s', 'f', 'return_or_enter', []),
      key('s', 'c', 'delete_or_backspace', ['command']),
      key('s', 'g', 'tab', ['command']),
      key('s', 'h', 'left_arrow', []),
      key('s', 'j', 'down_arrow', []),
      key('s', 'k', 'up_arrow', []),
      key('s', 'l', 'right_arrow', []),
      key('s', 'b', 'left_arrow', ['command']),
      key('s', 'n', 'v', ['command']),
      key('s', 'm', 'right_arrow', ['command']),
    ].flatten,
  )
end

def dkey()
  JSON.pretty_generate(
    'description' => 'd (mouse)',
    'manipulators' => [
      key('d', 'i', 'keypad_hyphen', ['command']), # Zoom in
      key('d', 'o', 'keypad_plus', ['command']), # Zoom out
      key('d', 'a', '8', ['command', 'option', 'control']),
      key('d', 'period', '3', ['command', 'option', 'control']),
      scroll('d', 'j', 'vertical_wheel', '40'),
      scroll('d', 'k', 'vertical_wheel', '-40')
    ].flatten,
  )
end

def fkey()
  JSON.pretty_generate(
    'description' => 'f (essential)',
    'manipulators' => [
      key('f', 'e', '8', ['option', 'command']), # alfred clipboard history search
      shell('f', 'semicolon',km('map: Think')),
      key('f', 'a', '4', ['option', 'control', 'command']),
      shell('f', 'j', km('Open 1st iTerm tab')),
      shell('f', 'h', km('Make markdown link from selection')),
      shell('f', 'comma', km('Add safari link to selected markdown text')),
      key('f', 'k', 'return_or_enter', []),
      key('f', 'z', 'spacebar', ['option']),
      key('f', 'l', 'return_or_enter', ['command']),
      key('f', '3', 'p', ['command', 'option', 'control']),
      key('f', 'o', 'return_or_enter', ['fn']),
      key('f', 'i', 'return_or_enter', ['shift']),
      key('f', 'n', 'return_or_enter', ['control']),
      key('f', 'm', 'return_or_enter', ['option']),
    ].flatten,
  )
end

def gkey()
  JSON.pretty_generate(
    'description' => 'g (things)',
    'manipulators' => [
      key('g', 'k', 'f', ['option', 'command', 'shift']),
      key('g', 'q', '0', ['option', 'command']),
      key('g', 'w', 'grave_accent_and_tilde', ['shift', 'command']),
      key('g', 'semicolon', 'grave_accent_and_tilde', ['command']),
      shell('g', 'i', km('New SnippetsLab snippet')),
      key('g', 'e', 'equal_sign', ['option', 'command']),
      key('g', 'm', '2', ['option', 'command', 'control']),
      key('g', 'n', 'slash', ['option', 'command']),
      shell('g', 's', km('Test')),
      key('g', 'l','d',['command','option','shift']),
      key('g', 'h','a',['command','option','shift']),
      shell('g', 'o', alfred('new task', 'nikivi.todo.task')),
      shell('g', 'z',km('Dismiss notifications')),
      shell('g', 'j',alfred('search km macros','iansinnott.keyboardmaestro')),
    ].flatten,
  )
end

def zkey()
  JSON.pretty_generate(
    'description' => 'z (chat)',
    'manipulators' => [
      shell('z', 'i', km('open: Tweetbot')),
      shell('z', 'f', km('open: Spark')),
      shell('z', 'g', alfred('search contacts', 'nikivi.search.content')),
      shell('z', 'e', km('open: Telegram')),
      shell('z', 'n', km('Create new contact')),
      shell('z', 'k', km('open: Telegram')),
      shell('z', 'j', km('open: Textual')),
      shell('z', 'semicolon', km('w: Slack')),
      shell('z', 'l', km('w: Discord')),
    ].flatten,
  )
end

def xkey()
  JSON.pretty_generate(
    'description' => 'x (alfred)',
    'manipulators' => [
      shell('x', 'l', alfred('search wiki', 'nikivi.mind')),
    ].flatten,
  )
end

def ckey()
  JSON.pretty_generate(
    'description' => 'c',
    'manipulators' => [
      shell('c', 'm',km('w: GitHub notifications')),
      shell('c', 'n',km('w: Medium')),
      shell('c', 'j',km('w: YouTube')),
      shell('c', 'i',km('w: regex101')),
      shell('c', 'semicolon',km('w: Stack Overflow')),
    ].flatten,
  )
end

def vkey()
  JSON.pretty_generate(
    'description' => 'v (media)',
    'manipulators' => [
      shell('v', 'semicolon', km('edit: Karabiner')),
      shell('v', 'e', km('edit: vimrc')),
      shell('v', 'r', km('edit: darwin.nix')),
      key('v', 'j', 'mute', []),
      shell('v', 'a', km('Noizio change')),
      key('v', 's', '0', ['control', 'shift']), # Torn on/off Noizio
      key('v', 'i', 'display_brightness_decrement', []),
      key('v', 'o', 'display_brightness_increment', []),
      key('v', 'h', 'vk_consumer_previous', []),
      key('v', 'l', 'vk_consumer_next', []),
      key('v', 'n', 'volume_decrement', []),
      key('v', 'm', 'volume_increment', []),
    ].flatten,
  )
end

def bkey()
  JSON.pretty_generate(
    'description' => 'b (alfred)',
    'manipulators' => [
      shell('b', 'h',alfred('search hn', 'com.vitorgalvao.alfred.hackerboard')),
      shell('b', 'j', km('Clone repo to ~/src/clones')),
      shell('b', 'l',alfred('search snippets', 'com.renfei.SnippetsLab.AlfredWorkflow')),
    ].flatten,
  )
end

def nkey()
  JSON.pretty_generate(
    'description' => 'n (alfred)',
    'manipulators' => [
      key('n', '1', '1', ['option']),
      key('n', '2', '2', ['option']),
      key('n', '3', '3', ['option']),
      key('n', '4', '4', ['option']),
      key('n', '5', '5', ['option']),
      key('n', '6', '6', ['option']),
      shell('n', 'e', alfred('search subs', 'net.deanishe.alfred-reddit')),
      shell('n', 'd', alfred('search packages', 'com.sindresorhus.npms')),
      shell('n', 'x', alfred('search lobsters', 'nikivi.search.the.web')),
      shell('n', 'a', alfred('search shares', 'nikivi.ask.create.share')),
      shell('n', 's', alfred('search websites', 'nikivi.web.searches')),
      shell('n', 'f', alfred('search repos', 'me.lachlan.githubjump')),
      shell('n', 'g', alfred('search godoc', 'nikivi.search.the.web')),
      shell('n', 'w', alfred('search github', 'nikivi.search.the.web')),
      shell('n', 'caps_lock', alfred('search learn anything', 'nikivi.learn.anything')),
    ].flatten,
  )
end

def mkey()
  JSON.pretty_generate(
    'description' => 'm (spotify)',
    'manipulators' => [
      key('m', 'a', '1', ['command', 'option', 'control']), # New Tweetbot tweet
      shell('m', 's', alfred('spot_mini', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'z', alfred('song_radio', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'd', alfred('show_current_track', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'x', alfred('web_search_current_track', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'g', alfred('add_current_track_to_alfred_playlist_or_your_music', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'h', alfred('remove_current_track_from', 'com.vdesabou.spotify.mini.player')),
      shell('m', 'caps_lock',km('Send tweet with current URL')),
      shell('m', 'f',km('New tweet with current URL')),
    ].flatten,
  )
end

def commakey()
  JSON.pretty_generate(
    'description' => 'comma',
    'manipulators' => [
      shell('comma', 'a',km('Google clipboard')),
      shell('comma', 'g',km('Commit my wiki')),
    ].flatten,
  )
end

# TODO: doesn't work
def tildakey()
  JSON.pretty_generate(
    'description' => 'tilda',
    'manipulators' => [
      shell('grave_accent_and_tilde', 'j', km('proj: Dotfiles')),
      shell('grave_accent_and_tilde', 'k', km('proj: Knowledge')),
      shell('grave_accent_and_tilde', 'h', km('proj: Hammerspoon')),
      #key('grave_accent_and_tilde', 'spacebar', 's', ['shift', 'option', 'control']), # search selection on DuckDuckGo
    ].flatten,
  )
end

# TODO: doesn't work
def spacebarkey()
  JSON.pretty_generate(
    'description' => 'spacebar',
    'manipulators' => [
      #simshell('spacebar', 'i', alfred('search google images', 'net.deanishe.alfred-searchio')),
      shell('spacebar','n',alfred('search km macros','iansinnott.keyboardmaestro')),
    ].flatten,
  )
end

# TODO: finish
def capskey()
  JSON.pretty_generate(
    'description' => '',
    'manipulators' => [
      key('caps_lock', 'open_bracket', 'open_bracket', ['option', 'control']),
      key('caps_lock', 'close_bracket', 'close_bracket', ['option', 'control']),
      key('caps_lock', 'semicolon', 'semicolon', ['option', 'control']),
      key('caps_lock', 'quote', 'quote', ['option', 'control']),
      key('caps_lock', 'comma', 'comma', ['option', 'control']),
      key('caps_lock', 'period', 'period', ['option', 'control']),
      key('caps_lock', 'slash', 'slash', ['option', 'control']),
      key('caps_lock', 'a', 'a', ['option', 'control']),
      key('caps_lock', 'b', 'b', ['option', 'control']),
      key('caps_lock', 'c', 'c', ['option', 'control']),
      key('caps_lock', 'd', 'd', ['option', 'control']),
      key('caps_lock', 'e', 'e', ['option', 'control']),
      key('caps_lock', 'f', 'f', ['option', 'control']),
      key('caps_lock', 'g', 'g', ['option', 'control']),
      key('caps_lock', 'h', 'h', ['option', 'control']),
      key('caps_lock', 'i', 'i', ['option', 'control']),
      key('caps_lock', 'j', 'j', ['option', 'control']),
      key('caps_lock', 'k', 'k', ['option', 'control']),
      key('caps_lock', 'l', 'l', ['option', 'control']),
      key('caps_lock', 'm', 'm', ['option', 'control']),
      key('caps_lock', 'n', 'n', ['option', 'control']),
      key('caps_lock', 'o', 'o', ['option', 'control']),
      key('caps_lock', 'p', 'p', ['option', 'control']),
      key('caps_lock', 'q', 'q', ['option', 'control']),
      key('caps_lock', 'r', 'r', ['option', 'control']),
      key('caps_lock', 's', 's', ['option', 'control']),
      key('caps_lock', 't', 't', ['option', 'control']),
      key('caps_lock', 'u', 'u', ['option', 'control']),
      key('caps_lock', 'v', 'v', ['option', 'control']),
      key('caps_lock', 'w', 'w', ['option', 'control']),
      key('caps_lock', 'x', 'x', ['option', 'control']),
      key('caps_lock', 'y', 'y', ['option', 'control']),
      key('caps_lock', 'z', 'z', ['option', 'control']),
      key('caps_lock', '1', '1', ['option', 'control']),
      key('caps_lock', '2', '2', ['option', 'control']),
      key('caps_lock', '3', '3', ['option', 'control']),
      key('caps_lock', '4', '4', ['option', 'control']),
      key('caps_lock', '5', '5', ['option', 'control']),
      key('caps_lock', '6', '6', ['option', 'control']),
      key('caps_lock', '7', '7', ['option', 'control']),
      key('caps_lock', '8', '8', ['option', 'control']),
      key('caps_lock', '9', '9', ['option', 'control']),
      key('caps_lock', '0', '0', ['option', 'control']),
    ].flatten,
  )
end

def fourkey()
  JSON.pretty_generate(
    'description' => '4',
    'manipulators' => [
      key('4', 'j', km('test: JavaScript')), 
    ].flatten,
  )
end

# TODO: doesn't work
def rightoptkey()
  JSON.pretty_generate(
    'description' => 'right option',
    'manipulators' => [
      shell('right_option', 'return', km('open: Safari')),
    ].flatten,
  )
end

def gen_json(arr)
  arr.join(",")
end

def write_rule_to_karabiner_config_file()
  karabiner_config_file = open($karabiner_config_file_dir)
  karabiner_config_json = JSON.parse(karabiner_config_file.read)
  karabiner_profiles = karabiner_config_json["profiles"]
  $conf.each_index { |i| $conf[i] = JSON.parse($conf[i]) }
  karabiner_profiles.each { |profile| profile["name"] == "generator-test" and profile["complex_modifications"]["rules"] = $conf }
  open($karabiner_config_file_dir, 'w') { |file| file << JSON.pretty_generate(karabiner_config_json)}
end

# TODO: Old sim keys I used. Must move either to sim or other place.
# k m -> alfred: snippetslab search
# l m -> alfred: safari bookmark search
# : k -> alfred: ssh search
# : m -> alfred: keywords search
# k n -> alfred: google lucky search. Ideally this goes inside Google searchio search under cmd modifier press
# space semicolon ->  alfred: dash profile switch
# space j -> km: get current safari url
# space l -> alfred: safari history search
# space k -> alfred: youtube search
