import 'package:car_renatl_app/core/widgets/bottom_navigation.dart';
import 'package:car_renatl_app/core/widgets/date_time_picker.dart';
import 'package:flutter/material.dart';

class StartBookingPage extends StatefulWidget {
  const StartBookingPage({super.key});

  @override
  State<StartBookingPage> createState() => _StartBookingPageState();
}

class _StartBookingPageState extends State<StartBookingPage> {
  final TextEditingController _startDateC = TextEditingController();
  final TextEditingController _endDateC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _title(),
                _startBookingForm(context),
                Container(
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _title() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Own a car without actually buying it",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Book now...",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Form _startBookingForm(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<int>(
              hint: const Text("Choose Pickup Location"),
              onChanged: (int? value) {},
              decoration: InputDecoration(
                label: const Text("Address"),
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
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text(
                    "Address 1",
                  ),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text(
                    "Address 2",
                  ),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text(
                    "Address 3",
                  ),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text(
                    "Address 4",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
              controller: _startDateC,
              firstDate: DateTime.now(),
              label: const Text("Start Trip"),
              lastDate: DateTime(2200),
              onChange: (String value) {
                setState(
                  () {
                    _startDateC.text = value;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
              controller: _endDateC,
              firstDate: DateTime.now().add(
                const Duration(days: 1),
              ),
              label: const Text("End Trip"),
              lastDate: DateTime(2200),
              onChange: (String value) {
                setState(
                  () {
                    _endDateC.text = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
