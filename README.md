# Karabiner config generator
> DSL to easily modify [Karabiner](https://github.com/tekezo/Karabiner-Elements) configuration

The idea is to make a small language with first class support for variables, sticky key and simultaneous key definitions that generates [Karabiner JSON](https://pqrs.org/osx/karabiner/json.html).

The script is a modified version of a [ruby script](https://github.com/pqrs-org/KE-complex_modifications/blob/master/src/json/personal_tekezo_launcher_mode_v4.json.rb) by [Tekezo](https://github.com/tekezo).

The [included config](config.rb) contains my own private keyboard configuration. To generate it and add it to Karabiner Elements, run this command:
`ruby call.rb` Or you can download [modd](https://github.com/cortesi/modd) and run `modd` to automatically generate the rules on any of the ruby file changes.

To have it work you first have to create a profile in Karabiner Elements with name `generator-test`.

![](https://i.imgur.com/HLqDc1p.png)

## Support
There is a [Telegram group](https://t.me/karabinermac) you can join to ask questions and build the most awesome DSL for describing keyboard configuration.

## Related
- [Karabiner JSON Spec](https://pqrs.org/osx/karabiner/json.html)
- [GokuRakuJoudo](https://github.com/yqrashawn/GokuRakuJoudo#readme) - Another tool to manage Karabiner configuration.

## Contributing
[Suggestions](../../issues/) and pull requests are highly encouraged!

## License
MIT © [Nikita Voloboev](https://nikitavoloboev.xyz)