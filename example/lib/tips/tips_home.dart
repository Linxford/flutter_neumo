import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

import 'border/tips_border.dart';
import 'border/tips_emboss_inside_emboss.dart';

class TipsHome extends StatelessWidget {
  Widget _buildButton({String text, VoidCallback onClick}) {
    return NeumoButton(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumoStyle(
        shape: NeumoShape.flat,
        boxShape: NeumoBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
      ),
      child: Center(child: Text(text)),
      onPressed: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      theme: NeumoThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumoColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopBar(title: "Tips"),
                  _buildButton(
                      text: "Border",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TipsBorderPage();
                        }));
                      }),
                  _buildButton(
                      text: "Recursive Emboss",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TipsRecursiveeEmbossPage();
                        }));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
