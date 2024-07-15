import "package:flutter/material.dart";

/*
아래와 같이 컬러 사용
color: Theme.of(context).colorScheme.onSurface
 */

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFF5A536), // App Key Color
  onPrimary: Color(4294967295),
  secondary: Color(0xFFA0A5BA), // Secondary Color
  onSecondary: natural,
  tertiary: Color(0xFF72B75A), // Third Color
  onTertiary: Color(4294967295),
  error: Color(4290386458),
  onError: Color(4294967295),
  outline: Color(0xFFD4D6DD), // Natural Color
  
  shadow: Color(0xFF71727A), // Last Color
  
  surface: Color(4294768888), // White / Black in Dark Mode
  onSurface: Color(4280032028), // Black / White in Dark Mode
  
  primaryFixed: Color(4294958520),
);

const natural = Color(0xFFD4D6DD);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(4294955422),
  onPrimary: Color(4294967295),
  secondary: Color(4290496480),
  onSecondary: Color(4294967295),
  tertiary: Color(4285181779),
  onTertiary: Color(4294967295),
  error: Color(4290386458),
  onError: Color(4294967295),
  outline: Color(0xFFD4D6DD),

  shadow: Color(0xFF71727A),

  surface: Color(4280032028),
  onSurface: Color(4294768888),

  primaryFixed: Color(4294958520),
);

// const lightColorScheme = ColorScheme( //기존 Material theme builder 내용
//   brightness: Brightness.light,
//   primary: Color(4286993152),
//   surfaceTint: Color(4286993152),
//   onPrimary: Color(4294967295),
//   primaryContainer: Color(4294946368),  //우리의 Main Color
//   onPrimaryContainer: Color(4282853888),
//   secondary: Color(4283654005),
//   onSecondary: Color(4294967295),
//   secondaryContainer: Color(4288391103), // Second Color
//   onSecondaryContainer: Color(4279245871),
//   tertiary: Color(4281035800),
//   onTertiary: Color(4294967295),
//   tertiaryContainer: Color(4286432100), //tertiary
//   onTertiaryContainer: Color(4278594816),
//   error: Color(4290386458), //Error
//   onError: Color(4294967295),
//   errorContainer: Color(4294957782),
//   onErrorContainer: Color(4282449922),
//   surface: Color(4294768888),
//   onSurface: Color(4280032028),
//   onSurfaceVariant: Color(4282795595), // 5번째?
//   outline: Color(4286019452),
//   outlineVariant: Color(4291282635),   //이건가
//   shadow: Color(4278190080),
//   scrim: Color(4278190080),
//   inverseSurface: Color(4281413680),
//   inversePrimary: Color(4294949216),
//   primaryFixed: Color(4294958520),
//   onPrimaryFixed: Color(4281014016),
//   primaryFixedDim: Color(4294949216),
//   onPrimaryFixedVariant: Color(4284825088),
//   secondaryFixed: Color(4292338685),
//   onSecondaryFixed: Color(4279180335),
//   secondaryFixedDim: Color(4290496480),
//   onSecondaryFixedVariant: Color(4282074972),
//   tertiaryFixed: Color(4289525136),
//   onTertiaryFixed: Color(4278395136),
//   tertiaryFixedDim: Color(4287748215),
//   onTertiaryFixedVariant: Color(4279325440),
//   surfaceDim: Color(4292663769),
//   surfaceBright: Color(4294768888),
//   surfaceContainerLowest: Color(4294967295),
//   surfaceContainerLow: Color(4294374387),
//   surfaceContainer: Color(4293979629),
//   surfaceContainerHigh: Color(4293650407),
//   surfaceContainerHighest: Color(4293255906),
// );
// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(4294955422),
//   surfaceTint: Color(4294949216),
//   onPrimary: Color(-16777216),
//   primaryContainer: Color(4293828400),
//   onPrimaryContainer: Color(4281802752),
//   secondary: Color(4290496480),
//   onSecondary: Color(4280627525),
//   secondaryContainer: Color(4287075243),
//   onSecondaryContainer: Color(4278190080),
//   tertiary: Color(4287748471),
//   onTertiary: Color(4278794496),
//   tertiaryContainer: Color(4285181779),
//   onTertiaryContainer: Color(4278326528),
//   error: Color(4294948011),
//   onError: Color(4285071365),
//   errorContainer: Color(4287823882),
//   onErrorContainer: Color(4294957782),
//   surface: Color(4279440148),
//   onSurface: Color(4293255906),
//   onSurfaceVariant: Color(4291282635),
//   outline: Color(4287729813),
//   outlineVariant: Color(4282795595),
//   shadow: Color(4278190080),
//   scrim: Color(4278190080),
//   inverseSurface: Color(4293255906),
//   inversePrimary: Color(4286993152),
//   primaryFixed: Color(4294958520),
//   onPrimaryFixed: Color(4281014016),
//   primaryFixedDim: Color(4294949216),
//   onPrimaryFixedVariant: Color(4284825088),
//   secondaryFixed: Color(4292338685),
//   onSecondaryFixed: Color(4279180335),
//   secondaryFixedDim: Color(4290496480),
//   onSecondaryFixedVariant: Color(4282074972),
//   tertiaryFixed: Color(4289525136),
//   onTertiaryFixed: Color(4278395136),
//   onTertiaryFixedVariant: Color(4279325440),
//   surfaceDim: Color(4279440148),
//   tertiaryFixedDim: Color(4287748215),
//   surfaceBright: Color(4282005817),
//   surfaceContainerLowest: Color(4279111182),
//   surfaceContainerLow: Color(4280032028),
//   surfaceContainer: Color(4280295200),
//   surfaceContainerHigh: Color(4280953386),
//   surfaceContainerHighest: Color(4281676853),
// );
// //