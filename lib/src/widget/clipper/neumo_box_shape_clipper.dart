import 'package:flutter/widgets.dart';
import 'package:flutter_neumo/src/shape/neumo_path_provider.dart';

import '../../neumo_box_shape.dart';

class NeumoBoxShapeClipper extends StatelessWidget {
  final NeumoBoxShape shape;
  final Widget? child;

  const NeumoBoxShapeClipper({super.key, required this.shape, this.child});

  NeumoPathProvider _getClipper(NeumoBoxShape shape) {
    return shape.customShapePathProvider;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _getClipper(shape),
      child: child,
    );
  }
}
