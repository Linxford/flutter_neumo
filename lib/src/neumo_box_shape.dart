import 'package:flutter_neumo/flutter_neumo.dart';
import 'package:flutter_neumo/src/shape/rrect_path_provider.dart';
import 'package:flutter_neumo/src/shape/stadium_path_provider.dart';

import 'shape/beveled_path_provider.dart';
import 'shape/circle_path_provider.dart';
import 'shape/rect_path_provider.dart';

export 'shape/path/flutter_logo_path_provider.dart';

/// Define a Neumo container box shape

class NeumoBoxShape {
  final NeumoPathProvider customShapePathProvider;

  const NeumoBoxShape._(this.customShapePathProvider);

  const NeumoBoxShape.circle() : this._(const CirclePathProvider());

  const NeumoBoxShape.path(NeumoPathProvider pathProvider)
      : this._(pathProvider);

  const NeumoBoxShape.rect() : this._(const RectPathProvider());

  const NeumoBoxShape.stadium() : this._(const StadiumPathProvider());

  NeumoBoxShape.roundRect(BorderRadius borderRadius)
      : this._(RRectPathProvider(borderRadius));

  NeumoBoxShape.beveled(BorderRadius borderRadius)
      : this._(BeveledPathProvider(borderRadius));

  bool get isCustomPath =>
      !isStadium && !isRect && !isCircle && !isRoundRect && !isBeveled;

  bool get isStadium =>
      customShapePathProvider.runtimeType == StadiumPathProvider;

  bool get isCircle =>
      customShapePathProvider.runtimeType == CirclePathProvider;

  bool get isRect => customShapePathProvider.runtimeType == RectPathProvider;

  bool get isRoundRect =>
      customShapePathProvider.runtimeType == RRectPathProvider;

  bool get isBeveled =>
      customShapePathProvider.runtimeType == BeveledPathProvider;

  static NeumoBoxShape? lerp(NeumoBoxShape? a, NeumoBoxShape? b, double t) {
    if (a == null && b == null) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    if (a == null) {
      if (b!.isCircle || b.isRect || b.isStadium || b.isCustomPath) {
        return b;
      } else {
        return NeumoBoxShape.roundRect(BorderRadius.lerp(
          null,
          (b.customShapePathProvider as RRectPathProvider).borderRadius,
          t,
        )!);
      }
    }
    if (a.isCircle || a.isRect || a.isStadium || a.isCustomPath) {
      return a;
    }

    if (b == null) {
      if (a.isCircle || a.isRect || a.isStadium || a.isCustomPath) {
        return a;
      } else {
        return NeumoBoxShape.roundRect(BorderRadius.lerp(
          null,
          (a.customShapePathProvider as RRectPathProvider).borderRadius,
          t,
        )!);
      }
    }
    if (b.isCircle || b.isRect || b.isStadium || b.isCustomPath) {
      return b;
    }

    if (a.isBeveled && b.isBeveled) {
      return NeumoBoxShape.beveled(BorderRadius.lerp(
        (a.customShapePathProvider as BeveledPathProvider).borderRadius,
        (b.customShapePathProvider as BeveledPathProvider).borderRadius,
        t,
      )!);
    }

    return NeumoBoxShape.roundRect(BorderRadius.lerp(
      (a.customShapePathProvider as RRectPathProvider).borderRadius,
      (b.customShapePathProvider as RRectPathProvider).borderRadius,
      t,
    )!);
  }
}
