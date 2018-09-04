#!/usr/bin/env ruby
require_relative 'config.rb'
require 'json'

$karabiner_config_file_dir = ENV["HOME"] + '/.config/karabiner/karabiner.json'

def main
  $conf = [
    colonkey(),
    swapkeys(),
    simj(),
    simk(),
    qkey(),
    wkey(),
    ekey(),
    rkey(),
    ikey(),
    okey(),
    akey(),
    skey(),
    dkey(),
    fkey(),
    gkey(),
    zkey(),
    xkey(),
    vkey(),
    bkey(),
    nkey(),
    mkey(),
    ckey(),
    tkey(),
    ukey(),
    commakey(),
    capskey(),
    #fourkey(),
  ]

  write_rule_to_karabiner_config_file
end
main
