import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumoStyle? style;
  final EdgeInsets? padding;
  final bool forward;

  const NeumoBackButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
    this.forward = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumoTheme.of(context)!.current!.appBarTheme.icons;
    return NeumoButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      child: forward ? nThemeIcons.forwardIcon : nThemeIcons.backIcon,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
