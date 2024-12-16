import '../../flutter_neumo.dart';

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

const BoxConstraints _kMiniSizeConstraints = BoxConstraints.tightFor(
  width: 40.0,
  height: 40.0,
);

class NeumoFloatingActionButton extends StatelessWidget {
  final Widget? child;
  final NeumoButtonClickListener? onPressed;
  final bool mini;
  final String? tooltip;
  final NeumoStyle? style;

  const NeumoFloatingActionButton({
    super.key,
    this.mini = false,
    this.style,
    this.tooltip,
    @required this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: mini ? _kMiniSizeConstraints : _kSizeConstraints,
      child: NeumoButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        tooltip: tooltip,
        style:
            style ?? NeumoTheme.currentTheme(context).appBarTheme.buttonStyle,
        child: child,
      ),
    );
  }
}
