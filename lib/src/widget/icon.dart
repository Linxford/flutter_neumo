import '../../flutter_neumo.dart';

export '../decoration/neumo_decorations.dart';
export '../neumo_box_shape.dart';
export '../theme/neumo_theme.dart';

@immutable
class NeumoIcon extends StatelessWidget {
  final IconData icon;
  final NeumoStyle? style;
  final Curve curve;
  final double size;
  final Duration duration;

  const NeumoIcon(
    this.icon, {
    super.key,
    this.duration = Neumo.DEFAULT_DURATION,
    this.curve = Neumo.DEFAULT_CURVE,
    this.style,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return NeumoText(
      String.fromCharCode(icon.codePoint),
      textStyle: NeumoTextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
      duration: duration,
      style: style,
      curve: curve,
    );
  }
}
