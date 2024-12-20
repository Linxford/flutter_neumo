import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoBack extends StatelessWidget {
  const NeumoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumoButton(
      padding: const EdgeInsets.all(18),
      style: const NeumoStyle(
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
