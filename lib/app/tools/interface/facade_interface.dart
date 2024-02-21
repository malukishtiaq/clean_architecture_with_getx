import 'package:flutter/material.dart';

typedef FacadeBuilder = Widget Function(AsyncSnapshot<Widget> snapshot);

typedef FacadeState = Widget;

typedef FacadeStateSetter = void Function();

abstract class FacadeInterface {
  Widget get initialState;
}
