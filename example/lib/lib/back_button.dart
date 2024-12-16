import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumoButton(
      padding: EdgeInsets.all(18),
      style: NeumoStyle(
        boxShape: NeumoBoxShape.circle(),
        shape: NeumoShape.flat,
      ),
      child: Icon(
        Icons.arrow_back,
        color:
            NeumoTheme.isUsingDark(context) ? Colors.white70 : Colors.black87,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
