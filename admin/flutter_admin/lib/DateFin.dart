import 'package:flutter/material.dart';
import 'package:flutter_admin/Date.dart';

class DateTimeFormd extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeFormd> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BasicDateField(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
