import 'dart:math';

import '../../flutter_neumo.dart';
import 'neumo_path_provider.dart';

class CirclePathProvider extends NeumoPathProvider {
  const CirclePathProvider({Listenable? reclip});

  @override
  bool shouldReclip(NeumoPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    final middleHeight = size.height / 2;
    final middleWidth = size.width / 2;
    return Path()
      ..addOval(Rect.fromCircle(
          center: Offset(middleWidth, middleHeight),
          radius: min(middleHeight, middleWidth)))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false; //because only 1 path
}
