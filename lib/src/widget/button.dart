import 'package:flutter/services.dart';
import 'package:flutter_neumo/flutter_neumo.dart';
import 'animation/animated_scale.dart' as animationScale;

typedef NeumoButtonClickListener = void Function();

/// A Neumo Button
///
/// When pressed, it will fire a call to its [NeumoButtonClickListener] click parameter
/// The animation starts from style.depth (or theme.depth is not defined in the style)
/// @see [NeumoStyle]
///
/// And finished to `minDistance`, in [duration] (time)
///
/// You can force the pressed state using [pressed]
/// - true : forced as pressed
/// - false : forced as unpressed
/// - null : can be pressed by user
///
/// It takes a [padding], default EdgeInsets.symmetric(horizontal: 8, vertical: 4)`
///
/// It takes a [NeumoStyle] @see [Neumorphi]
///
/// ```
///  NeumoButton(
///          onClick: () {
///            setState(() {
///               ...
///            });
///          },
///          boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(12)),
///          style: NeumoStyle(
///            shape: NeumoShape.flat,
///          ),
///          child: ...
///  )
/// ```
///
@immutable
class NeumoButton extends StatefulWidget {
  static const double PRESSED_SCALE = 0.98;
  static const double UNPRESSED_SCALE = 1.0;

  final Widget? child;
  final NeumoStyle? style;
  final double minDistance;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? pressed; //null, true, false
  final Duration duration;
  final Curve curve;
  final NeumoButtonClickListener? onPressed;
  final bool drawSurfaceAboveChild;
  final bool provideHapticFeedback;
  final String? tooltip;

  const NeumoButton({
    super.key,
    this.padding,
    this.margin = EdgeInsets.zero,
    this.child,
    this.tooltip,
    this.drawSurfaceAboveChild = true,
    this.pressed, //true/false if you want to change the state of the button
    this.duration = Neumo.DEFAULT_DURATION,
    this.curve = Neumo.DEFAULT_CURVE,
    //this.accent,
    this.onPressed,
    this.minDistance = 0,
    this.style,
    this.provideHapticFeedback = true,
  });

  bool get isEnabled => onPressed != null;

  @override
  _NeumoButtonState createState() => _NeumoButtonState();
}

class _NeumoButtonState extends State<NeumoButton> {
  late NeumoStyle initialStyle;

  late double depth;
  bool pressed = false; //overwrite widget.pressed when click for animation

  void updateInitialStyle() {
    final appBarPresent = NeumoTheme.of(context) != null;

    final theme = NeumoTheme.currentTheme(context);
    initialStyle = widget.style ??
        (appBarPresent
            ? theme.appBarTheme.buttonStyle
            : (theme.buttonStyle ?? const NeumoStyle()));
    depth = widget.style?.depth ??
        (appBarPresent ? theme.appBarTheme.buttonStyle.depth : theme.depth) ??
        0.0;

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateInitialStyle();
  }

  @override
  void didUpdateWidget(NeumoButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateInitialStyle();
  }

  Future<void> _handlePress() async {
    hasFinishedAnimationDown = false;
    setState(() {
      pressed = true;
      depth = widget.minDistance;
    });

    await Future.delayed(widget.duration); //wait until animation finished
    hasFinishedAnimationDown = true;

    //haptic vibration
    if (widget.provideHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    _resetIfTapUp();
  }

  bool hasDisposed = false;

  @override
  void dispose() {
    super.dispose();
    hasDisposed = true;
  }

  //used to stay pressed if no tap up
  void _resetIfTapUp() {
    if (hasFinishedAnimationDown == true && hasTapUp == true && !hasDisposed) {
      setState(() {
        pressed = false;
        depth = initialStyle.depth ?? neumoDefaultTheme.depth;

        hasFinishedAnimationDown = false;
        hasTapUp = false;
      });
    }
  }

  bool get clickable {
    return widget.isEnabled && widget.onPressed != null;
  }

  bool hasFinishedAnimationDown = false;
  bool hasTapUp = false;

  @override
  Widget build(BuildContext context) {
    final result = _build(context);
    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: result,
      );
    } else {
      return result;
    }
  }

  Widget _build(BuildContext context) {
    final appBarPresent = NeumoTheme.of(context) != null;
    final appBarTheme = NeumoTheme.currentTheme(context).appBarTheme;

    return GestureDetector(
      onTapDown: (detail) {
        hasTapUp = false;
        if (clickable && !pressed) {
          _handlePress();
        }
      },
      onTapUp: (details) {
        if (clickable) {
          widget.onPressed!();
        }
        hasTapUp = true;
        _resetIfTapUp();
      },
      onTapCancel: () {
        hasTapUp = true;
        _resetIfTapUp();
      },
      child: animationScale.AnimatedScale(
        scale: _getScale(),
        child: Neumo(
          margin: widget.margin ?? const EdgeInsets.all(0),
          drawSurfaceAboveChild: widget.drawSurfaceAboveChild,
          duration: widget.duration,
          curve: widget.curve,
          padding: widget.padding ??
              (appBarPresent ? appBarTheme.buttonPadding : null) ??
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          style: initialStyle.copyWith(
            depth: _getDepth(),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  double _getDepth() {
    if (widget.isEnabled) {
      return depth;
    } else {
      return 0;
    }
  }

  double _getScale() {
    if (widget.pressed != null) {
      //defined by the widget that use it
      return widget.pressed!
          ? NeumoButton.PRESSED_SCALE
          : NeumoButton.UNPRESSED_SCALE;
    } else {
      return pressed ? NeumoButton.PRESSED_SCALE : NeumoButton.UNPRESSED_SCALE;
    }
  }
}
