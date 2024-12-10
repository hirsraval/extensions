import 'package:flutter/widgets.dart';

extension $ScrollControllerExt on ScrollController {
  bool get attachedToView {
    return hasClients && positions.isNotEmpty && position.hasPixels && position.hasContentDimensions;
  }
}

extension $PageControllerExt on PageController {
  int get pageIndex {
    if (attachedToView) {
      return page?.round() ?? 0;
    } else {
      return 0;
    }
  }
}
