import 'package:flutter/services.dart';

class TextInputUtils {
  Future<void> hideInput() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
