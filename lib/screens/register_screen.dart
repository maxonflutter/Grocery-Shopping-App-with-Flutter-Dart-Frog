import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final isKeyboardOpen = viewInsets.bottom > 0.0;

    return Scaffold(
      backgroundColor: colorScheme.inverseSurface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Great! Let\'s get some basic info',
                        style: GoogleFonts.ibmPlexSerif(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      const _FirstNameInput().animate().fadeIn(
                            duration: const Duration(milliseconds: 200),
                          ),
                      const SizedBox(height: 16.0),
                      const _LastNameInput()
                          .animate(delay: const Duration(milliseconds: 200))
                          .fadeIn(duration: const Duration(milliseconds: 200)),
                      const SizedBox(height: 16.0),
                      const _EmailInput()
                          .animate(delay: const Duration(milliseconds: 400))
                          .fadeIn(duration: const Duration(milliseconds: 200)),
                      const SizedBox(height: 16.0),
                      _DateOfBirthInput()
                          .animate(delay: const Duration(milliseconds: 600))
                          .fadeIn(duration: const Duration(milliseconds: 200)),
                      const SizedBox(height: 16.0),
                      const _PhoneNumberInput()
                          .animate(delay: const Duration(milliseconds: 800))
                          .fadeIn(duration: const Duration(milliseconds: 200)),
                      const SizedBox(height: 16.0),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: false,
                        onChanged: (bool? value) {},
                        title: Text(
                          'By joining, I agree to the Terms & Conditions and Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                          .animate(delay: const Duration(milliseconds: 1000))
                          .fadeIn(duration: const Duration(milliseconds: 200)),
                    ],
                  ),
                ),
              ),
            ),
            isKeyboardOpen
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48.0),
                      ),
                      child: const Text("Continue"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  const _FirstNameInput();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        label: const Text('First Name'),
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        fillColor: colorScheme.background.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class _LastNameInput extends StatelessWidget {
  const _LastNameInput();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        label: const Text('Last Name'),
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        fillColor: colorScheme.background.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        label: const Text('Email'),
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        fillColor: colorScheme.background.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class _DateOfBirthInput extends StatefulWidget {
  @override
  _DateOfBirthInputState createState() => _DateOfBirthInputState();
}

class _DateOfBirthInputState extends State<_DateOfBirthInput> {
  TextEditingController dateController = TextEditingController();
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  _selectDate(BuildContext context) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            showDayOfWeek: true,
            onDateTimeChanged: (DateTime newDate) {
              setState(() => date = newDate);
              dateController.text = newDate.toLocal().toString().split(' ')[0];
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: dateController,
      keyboardType: TextInputType.text,
      onTap: () {
        // Hide keyboard when the user taps on the TextFormField
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
        filled: true,
        label: const Text('Date of Birth'),
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        fillColor: colorScheme.background.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoDatePicker Sample'),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _DatePickerItem(
                children: <Widget>[
                  const Text('Date'),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This shows day of week alongside day of month
                        showDayOfWeek: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => date = newDate);
                        },
                      ),
                    ),
                    // In this example, the date is formatted manually. You can
                    // use the intl package to format the value based on the
                    // user's locale settings.
                    child: Text(
                      '${date.month}-${date.day}-${date.year}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              _DatePickerItem(
                children: <Widget>[
                  const Text('Time'),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in time picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: time,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        // This is called when the user changes the time.
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => time = newTime);
                        },
                      ),
                    ),
                    // In this example, the time value is formatted manually.
                    // You can use the intl package to format the value based on
                    // the user's locale settings.
                    child: Text(
                      '${time.hour}:${time.minute}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              _DatePickerItem(
                children: <Widget>[
                  const Text('DateTime'),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in dateTime picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: dateTime,
                        use24hFormat: true,
                        // This is called when the user changes the dateTime.
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() => dateTime = newDateTime);
                        },
                      ),
                    ),
                    // In this example, the time value is formatted manually. You
                    // can use the intl package to format the value based on the
                    // user's locale settings.
                    child: Text(
                      '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                      style: const TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        label: const Text('Phone Number'),
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
        fillColor: colorScheme.background.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
