@JS()
// ignore: library_names
library jsQR;

import 'package:js/js.dart';

@JS('jsQR')
external scanQR(image, width, height);