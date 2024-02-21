import 'package:flutter/widgets.dart';

import '../../../app/tools/interface/facade_interface.dart';

abstract class ILogin<T extends StatefulWidget> extends State<T>
    implements FacadeInterface {
  ILogin();

  Widget get facebook;
  Widget get linkedin;
}
