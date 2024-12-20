import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../neumo_box_shape.dart';
import 'neumo_decoration_painter.dart';
import 'neumo_emboss_decoration_painter.dart';

@immutable
class NeumoDecoration extends Decoration {
  final NeumoStyle style;
  final NeumoBoxShape shape;
  final bool splitBackgroundForeground;
  final bool renderingByPath;
  final bool isForeground;

  const NeumoDecoration({
    required this.style,
    required this.isForeground,
    required this.renderingByPath,
    required this.splitBackgroundForeground,
    required this.shape,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    //print("createBoxPainter : ${style.depth}");
    if (style.depth != null && style.depth! >= 0) {
      return NeumoDecorationPainter(
        style: style,
        drawGradient: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        drawBackground: !isForeground,
        //only box draw background
        drawShadow: !isForeground,
        //only box draw shadow
        renderingByPath: renderingByPath,
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    } else {
      return NeumoEmbossDecorationPainter(
        drawBackground: !isForeground,
        style: style,
        drawShadow: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    }
  }

  @override
  NeumoDecoration lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is NeumoDecoration) return NeumoDecoration.lerp(a, this, t)!;
    return super.lerpFrom(a, t) as NeumoDecoration;
  }

  @override
  NeumoDecoration lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is NeumoDecoration) return NeumoDecoration.lerp(this, b, t)!;
    return super.lerpTo(b, t) as NeumoDecoration;
  }

  NeumoDecoration scale(double factor) {
    debugPrint("scale");
    return NeumoDecoration(
        isForeground: isForeground,
        renderingByPath: renderingByPath,
        splitBackgroundForeground: splitBackgroundForeground,
        shape: NeumoBoxShape.lerp(null, shape, factor)!,
        style: style.copyWith());
  }

  static NeumoDecoration? lerp(
      NeumoDecoration? a, NeumoDecoration? b, double t) {
    //print("lerp $t ${a.style.depth}, ${b.style.depth}");

    if (a == null && b == null) return null;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) {
      //print("return a");
      return a;
    }
    if (t == 1.0) {
      //print("return b (1.0)");
      return b;
    }

    var aStyle = a.style;
    var bStyle = b.style;

    return NeumoDecoration(
        isForeground: a.isForeground,
        shape: NeumoBoxShape.lerp(a.shape, b.shape, t)!,
        splitBackgroundForeground: a.splitBackgroundForeground,
        renderingByPath: a.renderingByPath,
        style: a.style.copyWith(
          border: NeumoBorder.lerp(aStyle.border, bStyle.border, t),
          intensity: lerpDouble(aStyle.intensity, bStyle.intensity, t),
          surfaceIntensity:
              lerpDouble(aStyle.surfaceIntensity, bStyle.surfaceIntensity, t),
          depth: lerpDouble(aStyle.depth, bStyle.depth, t),
          color: Color.lerp(aStyle.color, bStyle.color, t),
          lightSource:
              LightSource.lerp(aStyle.lightSource, bStyle.lightSource, t),
        ));
  }

  @override
  bool get isComplex => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumoDecoration &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          shape == other.shape &&
          splitBackgroundForeground == other.splitBackgroundForeground &&
          isForeground == other.isForeground &&
          renderingByPath == other.renderingByPath;

  @override
  int get hashCode =>
      style.hashCode ^
      shape.hashCode ^
      splitBackgroundForeground.hashCode ^
      isForeground.hashCode ^
      renderingByPath.hashCode;
}
