import 'package:flutter_neumo/flutter_neumo.dart';

import 'back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  static const double kToolbarHeight = 110.0;

  const TopBar({super.key, this.title = "", this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(alignment: Alignment.centerLeft, child: NeumoBack()),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: NeumoTheme.isUsingDark(context)
                    ? Colors.white70
                    : Colors.black87,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions ?? [],
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
