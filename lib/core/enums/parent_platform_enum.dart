import 'package:json_annotation/json_annotation.dart';

enum ParentPlatform {
  pc,
  playstation,
  xbox,
  ios,
  android,
  mac,
  linux,
  nintendo,
  atari,
  @JsonValue('commodore-amiga')
  commodoreAmiga,
  web,
}
