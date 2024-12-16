import 'package:flutter/widgets.dart';
import 'package:flutter_neumo/src/neumo_icons.dart';
import 'package:flutter_neumo/src/widget/container.dart';

import 'button.dart';

typedef NeumoCheckboxListener<T> = void Function(T value);

/// A Style used to customize a NeumoCheckbox
///
/// selectedDepth : the depth when checked
/// unselectedDepth : the depth when unchecked (default : theme.depth)
/// selectedColor : the color when checked (default: theme.accent)
///
class NeumoCheckboxStyle {
  final double? selectedDepth;
  final double? unselectedDepth;
  final bool? disableDepth;
  final double? selectedIntensity;
  final double unselectedIntensity;
  final Color? selectedColor;
  final Color? disabledColor;
  final LightSource? lightSource;
  final NeumoBorder border;
  final NeumoBoxShape? boxShape;

  const NeumoCheckboxStyle({
    this.selectedDepth,
    this.border = const NeumoBorder.none(),
    this.selectedColor,
    this.unselectedDepth,
    this.disableDepth,
    this.lightSource,
    this.disabledColor,
    this.boxShape,
    this.selectedIntensity = 1,
    this.unselectedIntensity = 0.7,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumoCheckboxStyle &&
          runtimeType == other.runtimeType &&
          selectedDepth == other.selectedDepth &&
          border == other.border &&
          unselectedDepth == other.unselectedDepth &&
          disableDepth == other.disableDepth &&
          selectedIntensity == other.selectedIntensity &&
          lightSource == other.lightSource &&
          unselectedIntensity == other.unselectedIntensity &&
          boxShape == other.boxShape &&
          selectedColor == other.selectedColor &&
          disabledColor == other.disabledColor;

  @override
  int get hashCode =>
      selectedDepth.hashCode ^
      unselectedDepth.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      disableDepth.hashCode ^
      selectedIntensity.hashCode ^
      unselectedIntensity.hashCode ^
      boxShape.hashCode ^
      selectedColor.hashCode ^
      disabledColor.hashCode;
}

/// A Neumo Checkbox
///
/// takes a NeumoCheckboxStyle as `style`
/// takes the current checked state as `value`
///
/// notifies the parent when user interact with this widget with `onChanged`
///
/// ```
///  bool check1 = false;
///  bool check2 = false;
///  bool check3 = false;
///
///  Widget _buildChecks() {
///    return Row(
///      children: <Widget>[
///
///        NeumoCheckbox(
///          value: check1,
///          onChanged: (value) {
///            setState(() {
///              check1 = value;
///            });
///          },
///        ),
///
///        NeumoCheckbox(
///          value: check2,
///          onChanged: (value) {
///            setState(() {
///              check2 = value;
///            });
///          },
///        ),
///
///        NeumoCheckbox(
///          value: check3,
///          onChanged: (value) {
///            setState(() {
///              check3 = value;
///            });
///          },
///        ),
///
///      ],
///    );
///  }
/// ```
///
@immutable
class NeumoCheckbox extends StatelessWidget {
  final bool value;
  final NeumoCheckboxStyle style;
  final NeumoCheckboxListener onChanged;
  final isEnabled;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;

  const NeumoCheckbox({
    super.key,
    this.style = const NeumoCheckboxStyle(),
    required this.value,
    required this.onChanged,
    this.curve = Neumo.DEFAULT_CURVE,
    this.duration = Neumo.DEFAULT_DURATION,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.margin = const EdgeInsets.all(0),
    this.isEnabled = true,
  });

  bool get isSelected => value;

  void _onClick() {
    onChanged(!value);
  }

  @override
  Widget build(BuildContext context) {
    final NeumoThemeData theme = NeumoTheme.currentTheme(context);
    final selectedColor = style.selectedColor ?? theme.accentColor;

    final double selectedDepth =
        -1 * (style.selectedDepth ?? theme.depth).abs();
    final double unselectedDepth = (style.unselectedDepth ?? theme.depth).abs();
    final double selectedIntensity =
        (style.selectedIntensity ?? theme.intensity)
            .abs()
            .clamp(Neumo.MIN_INTENSITY, Neumo.MAX_INTENSITY);
    final double unselectedIntensity = style.unselectedIntensity
        .clamp(Neumo.MIN_INTENSITY, Neumo.MAX_INTENSITY);

    double depth = isSelected ? selectedDepth : unselectedDepth;
    if (!isEnabled) {
      depth = 0;
    }

    Color? color = isSelected ? selectedColor : null;
    if (!isEnabled) {
      color = null;
    }

    Color iconColor = isSelected ? theme.baseColor : selectedColor;
    if (!isEnabled) {
      iconColor = theme.disabledColor;
    }

    return NeumoButton(
      padding: padding,
      pressed: isSelected,
      margin: margin,
      duration: duration,
      curve: curve,
      onPressed: () {
        if (isEnabled) {
          _onClick();
        }
      },
      drawSurfaceAboveChild: true,
      minDistance: selectedDepth.abs(),
      style: NeumoStyle(
        boxShape: style.boxShape,
        border: style.border,
        color: color,
        depth: depth,
        lightSource: style.lightSource ?? theme.lightSource,
        disableDepth: style.disableDepth,
        intensity: isSelected ? selectedIntensity : unselectedIntensity,
        shape: NeumoShape.flat,
      ),
      child: Icon(
        NeumoIcons.check,
        color: iconColor,
        size: 20.0,
      ),
    );
  }
}
