import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../neumo_box_shape.dart';
import '../decoration/neumo_decorations.dart';
import '../theme/neumo_theme.dart';
import 'clipper/neumo_box_shape_clipper.dart';

export '../neumo_box_shape.dart';
export '../decoration/neumo_decorations.dart';
export '../theme/neumo_theme.dart';

/// The main container of the Neumo UI KIT
/// it takes a Neumo style @see [NeumoStyle]
///
/// it's clipped using a [NeumoBoxShape] (circle, roundrect, stadium)
///
/// It can be, depending on its [NeumoStyle.shape] : [NeumoShape.concave],  [NeumoShape.convex],  [NeumoShape.flat]
///
/// if [NeumoStyle.depth] < 0 ----> use the emboss shape
///
/// The container animates any change for you, with [duration] ! (including style / theme / size / etc.)
///
/// [drawSurfaceAboveChild] enable to draw emboss, concave, convex effect above this widget child
///
/// drawSurfaceAboveChild - UseCase 1 :
///
///   put an image inside a neumo(concave) :
///   drawSurfaceAboveChild=false -> the concave effect is below the image
///   drawSurfaceAboveChild=true -> the concave effect is above the image, the image seems concave
///
/// drawSurfaceAboveChild - UseCase 2 :
///   put an image inside a neumo(emboss) :
///   drawSurfaceAboveChild=false -> the emboss effect is below the image -> not visible
///   drawSurfaceAboveChild=true -> the emboss effeect effect is above the image -> visible
///
@immutable
class Neumo extends StatelessWidget {
  static const DEFAULT_DURATION = Duration(milliseconds: 100);
  static const DEFAULT_CURVE = Curves.linear;

  static const double MIN_DEPTH = -20.0;
  static const double MAX_DEPTH = 20.0;

  static const double MIN_INTENSITY = 0.0;
  static const double MAX_INTENSITY = 1.0;

  static const double MIN_CURVE = 0.0;
  static const double MAX_CURVE = 1.0;

  final Widget? child;

  final NeumoStyle? style;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final Duration duration;
  final bool
      drawSurfaceAboveChild; //if true => boxDecoration & foreground decoration, else => boxDecoration does all the work

  const Neumo({
    super.key,
    this.child,
    this.duration = Neumo.DEFAULT_DURATION,
    this.curve = Neumo.DEFAULT_CURVE,
    this.style,
    this.textStyle,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = NeumoTheme.currentTheme(context);
    final NeumoStyle style = (this.style ?? const NeumoStyle())
        .copyWithThemeIfNull(theme)
        .applyDisableDepth();

    return _NeumoContainer(
      padding: padding,
      textStyle: textStyle,
      drawSurfaceAboveChild: drawSurfaceAboveChild,
      duration: duration,
      style: style,
      curve: curve,
      margin: margin,
      child: child,
    );
  }
}

class _NeumoContainer extends StatelessWidget {
  final NeumoStyle style;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;
  final bool drawSurfaceAboveChild;
  final EdgeInsets padding;

  const _NeumoContainer({
    this.child,
    this.textStyle,
    required this.padding,
    required this.margin,
    required this.duration,
    required this.curve,
    required this.style,
    required this.drawSurfaceAboveChild,
  });

  @override
  Widget build(BuildContext context) {
    final shape = style.boxShape ?? const NeumoBoxShape.rect();

    return DefaultTextStyle(
      style: textStyle ?? material.Theme.of(context).textTheme.bodyMedium!,
      child: AnimatedContainer(
        margin: margin,
        duration: duration,
        curve: curve,
        foregroundDecoration: NeumoDecoration(
          isForeground: true,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: drawSurfaceAboveChild,
          style: style,
          shape: shape,
        ),
        decoration: NeumoDecoration(
          isForeground: false,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: drawSurfaceAboveChild,
          style: style,
          shape: shape,
        ),
        child: NeumoBoxShapeClipper(
          shape: shape,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
