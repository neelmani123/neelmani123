import 'package:flutter/material.dart';
import 'package:localization/demo_localization.dart';
String getTranslated(BuildContext context,String key)
{
  return DemoLocalization.of(context).getTranslatedValue(key);
}