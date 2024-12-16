import 'dart:ui';

import '../../flutter_neumo.dart';

export '../colors.dart';
export '../light_source.dart';
export '../shape.dart';

//region theme
const double _defaultDepth = 4;
const double _defaultIntensity = 0.7;
const Color _defaultAccent = NeumoColors.accent;
const Color _defaultVariant = NeumoColors.variant;
const Color _defaultDisabledColor = NeumoColors.disabled;
const Color _defaultTextColor = NeumoColors.defaultTextColor;
const LightSource _defaultLightSource = LightSource.topLeft;
const Color _defaultBaseColor = NeumoColors.background;
const double _defaultBorderSize = 0.3;

/// Used with the NeumoTheme
///
/// ```
/// NeumoTheme(
///   theme: NeumoThemeData(...)
///   darkTheme: : NeumoThemeData(...)
///   child: ...
/// )`
/// ``
///
/// Contains all default values used in child Neumo Elements as
/// default colors : baseColor, accentColor, variantColor
/// default depth & intensities, used to generate white / dark shadows
/// default lightsource, used to calculate the angle of the shadow
/// @see [LightSource]
///
@immutable
class NeumoThemeData {
  final Color baseColor;
  final Color accentColor;
  final Color variantColor;
  final Color disabledColor;

  final Color shadowLightColor;
  final Color shadowDarkColor;
  final Color shadowLightColorEmboss;
  final Color shadowDarkColorEmboss;

  final NeumoBoxShape? _boxShape;
  NeumoBoxShape get boxShape =>
      _boxShape ?? NeumoBoxShape.roundRect(BorderRadius.circular(8));
  final Color borderColor;
  final double borderWidth;

  final Color defaultTextColor; //TODO maybe use TextStyle here
  final double _depth;
  final double _intensity;
  final LightSource lightSource;
  final bool disableDepth;

  /// Default text theme to use and apply across the app
  final TextTheme textTheme;

  /// Default button style to use and apply across the app
  final NeumoStyle? buttonStyle;

  /// Default icon theme to use and apply across the app
  final IconThemeData iconTheme;
  final NeumoAppBarThemeData appBarTheme;

  /// Get this theme's depth, clamp to min/max neumo constants
  double get depth => _depth.clamp(Neumo.MIN_DEPTH, Neumo.MAX_DEPTH);

  /// Get this theme's intensity, clamp to min/max neumo constants
  double get intensity =>
      _intensity.clamp(Neumo.MIN_INTENSITY, Neumo.MAX_INTENSITY);

  const NeumoThemeData({
    this.baseColor = _defaultBaseColor,
    double depth = _defaultDepth,
    NeumoBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.variantColor = _defaultVariant,
    this.disabledColor = _defaultDisabledColor,
    this.shadowLightColor = NeumoColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeumoColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeumoColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeumoColors.embossMaxDarkColor,
    this.defaultTextColor = _defaultTextColor,
    this.lightSource = _defaultLightSource,
    this.textTheme = const TextTheme(),
    this.iconTheme = const IconThemeData(),
    this.buttonStyle,
    this.appBarTheme = const NeumoAppBarThemeData(),
    this.borderColor = NeumoColors.defaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : _depth = depth,
        _boxShape = boxShape,
        _intensity = intensity;

  const NeumoThemeData.dark({
    this.baseColor = NeumoColors.darkBackground,
    double depth = _defaultDepth,
    NeumoBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.textTheme = const TextTheme(),
    this.buttonStyle,
    this.iconTheme = const IconThemeData(),
    this.appBarTheme = const NeumoAppBarThemeData(),
    this.variantColor = NeumoColors.darkVariant,
    this.disabledColor = NeumoColors.darkDisabled,
    this.shadowLightColor = NeumoColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeumoColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeumoColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeumoColors.embossMaxDarkColor,
    this.defaultTextColor = NeumoColors.darkDefaultTextColor,
    this.lightSource = _defaultLightSource,
    this.borderColor = NeumoColors.darkDefaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : _depth = depth,
        _boxShape = boxShape,
        _intensity = intensity;

  @override
  String toString() {
    return 'NeumoTheme{baseColor: $baseColor, boxShape: $boxShape, disableDepth: $disableDepth, accentColor: $accentColor, variantColor: $variantColor, disabledColor: $disabledColor, _depth: $_depth, intensity: $intensity, lightSource: $lightSource}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumoThemeData &&
          runtimeType == other.runtimeType &&
          baseColor == other.baseColor &&
          boxShape == other.boxShape &&
          textTheme == other.textTheme &&
          iconTheme == other.iconTheme &&
          buttonStyle == other.buttonStyle &&
          appBarTheme == other.appBarTheme &&
          accentColor == other.accentColor &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          disabledColor == other.disabledColor &&
          variantColor == other.variantColor &&
          disableDepth == other.disableDepth &&
          defaultTextColor == other.defaultTextColor &&
          borderWidth == other.borderWidth &&
          borderColor == other.borderColor &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          lightSource == other.lightSource;

  @override
  int get hashCode =>
      baseColor.hashCode ^
      textTheme.hashCode ^
      iconTheme.hashCode ^
      buttonStyle.hashCode ^
      appBarTheme.hashCode ^
      accentColor.hashCode ^
      variantColor.hashCode ^
      disabledColor.hashCode ^
      shadowDarkColor.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      defaultTextColor.hashCode ^
      disableDepth.hashCode ^
      borderWidth.hashCode ^
      borderColor.hashCode ^
      _depth.hashCode ^
      boxShape.hashCode ^
      _intensity.hashCode ^
      lightSource.hashCode;

  /// Create a copy of this theme
  /// With possibly new values given from this method's arguments
  NeumoThemeData copyWith({
    Color? baseColor,
    Color? accentColor,
    Color? variantColor,
    Color? disabledColor,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    Color? defaultTextColor,
    NeumoBoxShape? boxShape,
    TextTheme? textTheme,
    NeumoStyle? buttonStyle,
    IconThemeData? iconTheme,
    NeumoAppBarThemeData? appBarTheme,
    NeumoStyle? defaultStyle,
    bool? disableDepth,
    double? depth,
    double? intensity,
    Color? borderColor,
    double? borderSize,
    LightSource? lightSource,
  }) {
    return NeumoThemeData(
      baseColor: baseColor ?? this.baseColor,
      textTheme: textTheme ?? this.textTheme,
      iconTheme: iconTheme ?? this.iconTheme,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      boxShape: boxShape ?? this.boxShape,
      appBarTheme: appBarTheme ?? this.appBarTheme,
      accentColor: accentColor ?? this.accentColor,
      variantColor: variantColor ?? this.variantColor,
      disabledColor: disabledColor ?? this.disabledColor,
      defaultTextColor: defaultTextColor ?? this.defaultTextColor,
      disableDepth: disableDepth ?? this.disableDepth,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? _depth,
      borderWidth: borderSize ?? borderWidth,
      borderColor: borderColor ?? this.borderColor,
      intensity: intensity ?? _intensity,
      lightSource: lightSource ?? this.lightSource,
    );
  }

  /// Create a copy of this theme
  /// With possibly new values given from the given second theme
  NeumoThemeData copyFrom({
    required NeumoThemeData other,
  }) {
    return NeumoThemeData(
      baseColor: other.baseColor,
      accentColor: other.accentColor,
      variantColor: other.variantColor,
      disableDepth: other.disableDepth,
      disabledColor: other.disabledColor,
      defaultTextColor: other.defaultTextColor,
      shadowDarkColor: other.shadowDarkColor,
      shadowLightColor: other.shadowLightColor,
      shadowDarkColorEmboss: other.shadowDarkColorEmboss,
      shadowLightColorEmboss: other.shadowLightColorEmboss,
      textTheme: other.textTheme,
      iconTheme: other.iconTheme,
      buttonStyle: other.buttonStyle,
      appBarTheme: other.appBarTheme,
      depth: other.depth,
      boxShape: other.boxShape,
      borderColor: other.borderColor,
      borderWidth: other.borderWidth,
      intensity: other.intensity,
      lightSource: other.lightSource,
    );
  }
}
//endregion

//region style
const NeumoShape _defaultShape = NeumoShape.flat;
//const double _defaultBorderRadius = 5;

const neumoDefaultTheme = NeumoThemeData();
const neumoDefaultDarkTheme = NeumoThemeData.dark();

class NeumoBorder {
  final bool isEnabled;
  final Color? color;
  final double? width;

  const NeumoBorder({
    this.isEnabled = true,
    this.color,
    this.width,
  });

  const NeumoBorder.none()
      : isEnabled = true,
        color = const Color(0x00000000),
        width = 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumoBorder &&
          runtimeType == other.runtimeType &&
          isEnabled == other.isEnabled &&
          color == other.color &&
          width == other.width;

  @override
  int get hashCode => isEnabled.hashCode ^ color.hashCode ^ width.hashCode;

  @override
  String toString() {
    return 'NeumoBorder{isEnabled: $isEnabled, color: $color, width: $width}';
  }

  static NeumoBorder? lerp(NeumoBorder? a, NeumoBorder? b, double t) {
    if (a == null && b == null) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    return NeumoBorder(
      color: Color.lerp(a!.color, b!.color, t),
      isEnabled: a.isEnabled,
      width: lerpDouble(a.width, b.width, t),
    );
  }

  NeumoBorder copyWithThemeIfNull({Color? color, double? width}) {
    return NeumoBorder(
      isEnabled: isEnabled,
      color: this.color ?? color,
      width: this.width ?? width,
    );
  }
}

class NeumoStyle {
  final Color? color;
  final double? _depth;
  final double? _intensity;
  final double _surfaceIntensity;
  final LightSource lightSource;
  final bool? disableDepth;

  final NeumoBorder border;

  final bool oppositeShadowLightSource;

  final NeumoShape shape;
  final NeumoBoxShape? boxShape;
  final NeumoThemeData? theme;

  //override the "white" color
  final Color? shadowLightColor;

  //override the "dark" color
  final Color? shadowDarkColor;

  //override the "white" color
  final Color? shadowLightColorEmboss;

  //override the "dark" color
  final Color? shadowDarkColorEmboss;

  const NeumoStyle({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.border = const NeumoBorder.none(),
    this.color,
    this.boxShape, //nullable by default, will use the one defined in theme if not set
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
    this.disableDepth,
    this.oppositeShadowLightSource = false,
  })  : _depth = depth,
        theme = null,
        _intensity = intensity,
        _surfaceIntensity = surfaceIntensity;

  // with theme constructor is only available privately, please use copyWithThemeIfNull
  const NeumoStyle._withTheme({
    this.theme,
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.color,
    this.boxShape,
    this.border = const NeumoBorder.none(),
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    this.oppositeShadowLightSource = false,
    this.disableDepth,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
  })  : _depth = depth,
        _intensity = intensity,
        _surfaceIntensity = surfaceIntensity;

  double? get depth => _depth?.clamp(Neumo.MIN_DEPTH, Neumo.MAX_DEPTH);

  double? get intensity =>
      _intensity?.clamp(Neumo.MIN_INTENSITY, Neumo.MAX_INTENSITY);

  double get surfaceIntensity =>
      _surfaceIntensity.clamp(Neumo.MIN_INTENSITY, Neumo.MAX_INTENSITY);

  NeumoStyle copyWithThemeIfNull(NeumoThemeData theme) {
    return NeumoStyle._withTheme(
        theme: theme,
        color: color ?? theme.baseColor,
        boxShape: boxShape ?? theme.boxShape,
        shape: shape,
        border: border.copyWithThemeIfNull(
            color: theme.borderColor, width: theme.borderWidth),
        shadowDarkColor: shadowDarkColor ?? theme.shadowDarkColor,
        shadowLightColor: shadowLightColor ?? theme.shadowLightColor,
        shadowDarkColorEmboss:
            shadowDarkColorEmboss ?? theme.shadowDarkColorEmboss,
        shadowLightColorEmboss:
            shadowLightColorEmboss ?? theme.shadowLightColorEmboss,
        depth: depth ?? theme.depth,
        intensity: intensity ?? theme.intensity,
        disableDepth: disableDepth ?? theme.disableDepth,
        surfaceIntensity: surfaceIntensity,
        oppositeShadowLightSource: oppositeShadowLightSource,
        lightSource: lightSource);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumoStyle &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          boxShape == other.boxShape &&
          border == other.border &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          disableDepth == other.disableDepth &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          _surfaceIntensity == other._surfaceIntensity &&
          lightSource == other.lightSource &&
          oppositeShadowLightSource == other.oppositeShadowLightSource &&
          shape == other.shape &&
          theme == other.theme;

  @override
  int get hashCode =>
      color.hashCode ^
      shadowDarkColor.hashCode ^
      boxShape.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      _depth.hashCode ^
      border.hashCode ^
      _intensity.hashCode ^
      disableDepth.hashCode ^
      _surfaceIntensity.hashCode ^
      lightSource.hashCode ^
      oppositeShadowLightSource.hashCode ^
      shape.hashCode ^
      theme.hashCode;

  NeumoStyle copyWith({
    Color? color,
    NeumoBorder? border,
    NeumoBoxShape? boxShape,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double? surfaceIntensity,
    LightSource? lightSource,
    bool? disableDepth,
    double? borderRadius,
    bool? oppositeShadowLightSource,
    NeumoShape? shape,
  }) {
    return NeumoStyle._withTheme(
      color: color ?? this.color,
      border: border ?? this.border,
      boxShape: boxShape ?? this.boxShape,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? this.depth,
      theme: theme,
      intensity: intensity ?? this.intensity,
      surfaceIntensity: surfaceIntensity ?? this.surfaceIntensity,
      disableDepth: disableDepth ?? this.disableDepth,
      lightSource: lightSource ?? this.lightSource,
      oppositeShadowLightSource:
          oppositeShadowLightSource ?? this.oppositeShadowLightSource,
      shape: shape ?? this.shape,
    );
  }

  @override
  String toString() {
    return 'NeumoStyle{color: $color, boxShape: $boxShape, _depth: $_depth, intensity: $intensity, disableDepth: $disableDepth, lightSource: $lightSource, shape: $shape, theme: $theme, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }

  NeumoStyle applyDisableDepth() {
    if (disableDepth == true) {
      return copyWith(depth: 0);
    } else {
      return this;
    }
  }
}
//endregion
