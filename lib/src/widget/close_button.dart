import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumoStyle? style;
  final EdgeInsets? padding;

  const NeumoCloseButton({
    super.key,
    this.onPressed,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumoTheme.of(context)!.current!.appBarTheme.icons;
    return NeumoButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      child: nThemeIcons.closeIcon,
    );
  }
}
