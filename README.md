# Karabiner config generator
> DSL to easily modify [Karabiner](https://github.com/tekezo/Karabiner-Elements) configuration

The idea is to make a small language with first class support for variables, sticky key and simultaneous key definitions that generates [Karabiner JSON](https://pqrs.org/osx/karabiner/json.html).

The script is a modified version of a [ruby script](https://github.com/pqrs-org/KE-complex_modifications/blob/master/src/json/personal_tekezo_launcher_mode_v4.json.rb) by [Tekezo](https://github.com/tekezo).

The [included config](config.rb) contains my own private keyboard configuration. To generate it and add it to Karabiner Elements, run this command:
`ruby call.rb | pbcopy` Or you can download [modd](https://github.com/cortesi/modd) and run `modd` to automatically generate the rules on any file changes including `config.rb`.

This will put Karabiner JSON of all the rules in your clipboard. You can then paste it inside Karabiner config file found in `~/.config/karabiner/karabiner.json` in-between `rules []` block.

In future this will be automated even further so you will never have to be dealing with raw JSON of `karabiner.json` and can effortlessly change your keyboard config on the fly with a nice DSL.

## Support
There is a [Telegram group](https://t.me/karabinermac) you can join to ask questions and build the most awesome DSL for describing keyboard configuration.

## Related
- [Karabiner JSON Spec](https://pqrs.org/osx/karabiner/json.html)

## Contributing
[Suggestions](../../issues/) and pull requests are highly encouraged!

## License
MIT © [Nikita Voloboev](https://nikitavoloboev.xyz)