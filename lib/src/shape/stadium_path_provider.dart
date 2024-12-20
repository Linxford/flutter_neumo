import 'package:flutter_neumo/flutter_neumo.dart';

import 'rrect_path_provider.dart';

class StadiumPathProvider extends RRectPathProvider {
  const StadiumPathProvider({Listenable? reclip})
      : super(
            const BorderRadius.all(
              Radius.circular(1000),
            ),
            reclip: reclip);
}
