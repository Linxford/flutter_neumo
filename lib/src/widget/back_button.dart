import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumoStyle? style;
  final EdgeInsets? padding;
  final bool forward;

  const NeumoBackButton({
    super.key,
    this.onPressed,
    this.style,
    this.padding,
    this.forward = false,
  });

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumoTheme.of(context)!.current!.appBarTheme.icons;
    return NeumoButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      child: forward ? nThemeIcons.forwardIcon : nThemeIcons.backIcon,
    );
  }
}
