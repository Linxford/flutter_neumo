import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'neumo_emboss_decoration_painter.dart';
import 'neumo_text_decoration_painter.dart';

@immutable
class NeumoTextDecoration extends Decoration {
  final NeumoStyle style;
  final TextStyle textStyle;
  final String text;
  final bool renderingByPath;
  final bool isForeground;
  final TextAlign textAlign;

  const NeumoTextDecoration({
    required this.style,
    required this.textStyle,
    required this.isForeground,
    required this.renderingByPath,
    required this.text,
    required this.textAlign,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    //print("createBoxPainter : ${style.depth}");
    if (style.depth != null && style.depth! >= 0) {
      return NeumoDecorationTextPainter(
        style: style,
        textStyle: textStyle,
        textAlign: textAlign,
        drawGradient: true,
        drawBackground: !isForeground,
        //only box draw background
        drawShadow: !isForeground,
        //only box draw shadow
        renderingByPath: renderingByPath,
        onChanged: onChanged ?? () {},
        text: text,
      );
    } else {
      return NeumoEmptyTextPainter(onChanged: onChanged ?? () {});
    }
    /* else {
      return NeumoEmbossDecorationPainter(
        drawBackground: !isForeground,
        style: style,
        drawShadow: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        onChanged: onChanged,
        shape: shape,
      );
    }
    */
  }

  @override
  NeumoTextDecoration? lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is NeumoTextDecoration) return NeumoTextDecoration.lerp(a, this, t);
    return super.lerpFrom(a, t) as NeumoTextDecoration;
  }

  @override
  NeumoTextDecoration? lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is NeumoTextDecoration) return NeumoTextDecoration.lerp(this, b, t);
    return super.lerpTo(b, t) as NeumoTextDecoration;
  }

  NeumoTextDecoration scale(double factor) {
    print("scale");
    return NeumoTextDecoration(
        textAlign: textAlign,
        isForeground: isForeground,
        renderingByPath: renderingByPath,
        text: text,
        textStyle: textStyle,
        style: style.copyWith());
  }

  static NeumoTextDecoration? lerp(
      NeumoTextDecoration? a, NeumoTextDecoration? b, double t) {
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

    return NeumoTextDecoration(
        isForeground: a.isForeground,
        text: a.text,
        textAlign: a.textAlign,
        textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t) ?? const TextStyle(),
        renderingByPath: a.renderingByPath,
        style: a.style.copyWith(
          border: NeumoBorder.lerp(aStyle.border, bStyle.border, t),
          intensity: lerpDouble(aStyle.intensity, bStyle.intensity, t),
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
      other is NeumoTextDecoration &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          text == other.text &&
          textStyle == other.textStyle &&
          isForeground == other.isForeground &&
          renderingByPath == other.renderingByPath;

  @override
  int get hashCode =>
      style.hashCode ^
      text.hashCode ^
      textStyle.hashCode ^
      isForeground.hashCode ^
      renderingByPath.hashCode;
}
