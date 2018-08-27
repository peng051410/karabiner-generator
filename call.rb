#!/usr/bin/env ruby
require_relative 'config.rb'

def main
  puts gen_json([
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
  ])
end
main
