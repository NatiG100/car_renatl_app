import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key,
    required this.controller,
    required this.onChange,
    required this.firstDate,
    required this.lastDate,
    required this.label,
  });
  final TextEditingController controller;
  final void Function(String value) onChange;
  final DateTime firstDate;
  final DateTime lastDate;
  final Widget label;
  static const dateFormat = "yyyy-MM-dd - hh:mm a";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String dateTime) {},
      controller: controller,
      decoration: InputDecoration(
        label: label,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        hintStyle: TextStyle(color: Colors.black.withAlpha(80)),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 20,
          maxWidth: 40,
        ),
      ),
      onTap: () {
        DateTime? date;
        try {
          date = DateFormat(dateFormat).parse(controller.text);
        } catch (error) {}
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2200),
          currentDate: date,
        ).then((selectedDate) async {
          if (selectedDate == null) {
            return;
          }
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(
              hour: date?.hour ?? 12,
              minute: date?.minute ?? 0,
            ),
          );
          if (pickedTime != null) {
            selectedDate = selectedDate.add(
              Duration(hours: pickedTime.hour, minutes: pickedTime.minute),
            );
            String dateTimeString = DateFormat(dateFormat).format(selectedDate);
            onChange(dateTimeString);
          }
        });
      },
    );
  }
}
