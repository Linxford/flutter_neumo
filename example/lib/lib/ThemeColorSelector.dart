import 'package:flutter_neumo/flutter_neumo.dart';

import 'color_selector.dart';

class ThemeColorSelector extends StatefulWidget {
  final BuildContext customContext;

  const ThemeColorSelector({super.key, required this.customContext});

  @override
  _ThemeColorSelectorState createState() => _ThemeColorSelectorState();
}

class _ThemeColorSelectorState extends State<ThemeColorSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      color: Colors.black,
      child: ColorSelector(
        color: NeumoTheme.baseColor(widget.customContext),
        onColorChanged: (color) {
          setState(() {
            NeumoTheme.update(
                widget.customContext,
                (current) =>
                    current?.copyWith(baseColor: color) ??
                    const NeumoThemeData());
          });
        },
      ),
    );
  }
}
