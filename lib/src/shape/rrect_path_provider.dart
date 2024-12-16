import '../../flutter_neumo.dart';
import 'neumo_path_provider.dart';

class RRectPathProvider extends NeumoPathProvider {
  final BorderRadius borderRadius;

  const RRectPathProvider(this.borderRadius, {Listenable? reclip});

  @override
  bool shouldReclip(NeumoPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..addRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false; //because only 1 path
}
