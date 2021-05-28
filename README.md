# bingo_starter

A Flutter Starter Package with some simple but handy utilities
* Network aware mixin
* logger (Custom logger from [here](https://www.filledstacks.com/snippet/a-guide-to-setting-up-better-logging-in-flutter/))
* network helper (get/post/download image using dio)
* logger and network helper are also wrapped in a simple mixin
* json annotation (you don't need to import it in your pubspec again, it is already there in this package, but you would need to import [`json_serializable`](https://pub.dev/packages/json_serializable/install))
* removing that weird material scroll effect 

## Installation
Put this in your `pubspec.yaml` dependencies
``` yaml
bingo_starter:
    git:
      url: git@github.com:Illusion47586/bingo_starter.git
      ref: master
```
and add this line for importing
``` dart
import 'package:bingo_starter/bingo_starter.dart';
```

## Contributions
Contributions are welcome, just post the issue and comment if you are working on it.
