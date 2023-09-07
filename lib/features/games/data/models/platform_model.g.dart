// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformModel _$PlatformModelFromJson(Map<String, dynamic> json) =>
    PlatformModel(
      id: json['id'] as int?,
      slug: $enumDecodeNullable(_$PlatformEnumMap, json['slug']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PlatformModelToJson(PlatformModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': _$PlatformEnumMap[instance.slug],
      'name': instance.name,
    };

const _$PlatformEnumMap = {
  Platform.pc: 'pc',
  Platform.playstation5: 'playstation5',
  Platform.playstation4: 'playstation4',
  Platform.playstation3: 'playstation3',
  Platform.playstation2: 'playstation2',
  Platform.playstation1: 'playstation1',
  Platform.xboxOne: 'xbox-one',
  Platform.xboxSeriesX: 'xbox-series-x',
  Platform.nintendoSwitch: 'nintendo-switch',
  Platform.nintendo64: 'nintendo-64',
  Platform.ios: 'ios',
  Platform.android: 'android',
  Platform.nintendo3ds: 'nintendo-3ds',
  Platform.nintendoDs: 'nintendo-ds',
  Platform.nintendoDsi: 'nintendo-dsi',
  Platform.macos: 'macos',
  Platform.linux: 'linux',
  Platform.xbox360: 'xbox360',
  Platform.xboxOld: 'xbox-old',
  Platform.psVita: 'ps-vita',
  Platform.psp: 'psp',
  Platform.wiiU: 'wii-u',
  Platform.wii: 'wii',
  Platform.gamecube: 'gamecube',
  Platform.gameBoyAdvance: 'game-boy-advance',
  Platform.gameBoy: 'game-boy-color',
  Platform.gameBoyColor: 'game-boy',
  Platform.snes: 'snes',
  Platform.nes: 'nes',
  Platform.macintosh: 'macintosh',
  Platform.appleII: 'apple-ii',
  Platform.commodoreAmiga: 'commodore-amiga',
  Platform.atari7800: 'atari-7800',
  Platform.atari5200: 'atari-5200',
  Platform.atari2600: 'atari-2600',
  Platform.atariFlashback: 'atari-flashback',
  Platform.atari8Bit: 'atari-8-bit',
  Platform.atariST: 'atari-st',
  Platform.atariLynx: 'atari-lynx',
  Platform.atariXEGS: 'atari-xegs',
  Platform.genesis: 'genesis',
  Platform.segaSaturn: 'sega-saturn',
  Platform.segaCD: 'sega-cd',
  Platform.sega32x: 'sega-32x',
  Platform.segaMasterSystem: 'sega-master-system',
  Platform.dreamcast: 'dreamcast',
  Platform.threeDO: '3do',
  Platform.jaguar: 'jaguar',
  Platform.gameGear: 'game-gear',
  Platform.neogeo: 'neogeo',
  Platform.web: 'web',
};
