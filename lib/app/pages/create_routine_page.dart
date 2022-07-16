import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '/app/collections/category.dart';

class CreateRoutinePage extends StatefulWidget {
  final Isar isar;
  const CreateRoutinePage({
    Key? key,
    required this.isar,
  }) : super(key: key);

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  List<String> categories = ['work', 'school', 'home'];
  String dropdownValue = 'work';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _newCatController = TextEditingController();
  List<String> days = [
    'saturday',
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday'
  ];
  String dropdownDay = 'monday';
  TimeOfDay selectedTime = TimeOfDay.now();
  TextStyle textStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Routine'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: null,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category', style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: DropdownButton(
                      focusColor: Colors.white,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: dropdownValue,
                      items: categories
                          .map<DropdownMenuItem<String>>((String newValue) =>
                              DropdownMenuItem<String>(
                                  value: newValue, child: Text(newValue)))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('New Category'),
                          content: TextFormField(controller: _newCatController),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                if (_newCatController.text.isNotEmpty) {
                                  _addCategory(widget.isar);
                                }
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Title', style: textStyle),
              TextFormField(
                controller: _titleController,
              ),
              const SizedBox(height: 20),
              Text('Start time', style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: _timeController,
                      enabled: false,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _selectedTime(context);
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Day', style: textStyle),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownDay,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: days
                      .map<DropdownMenuItem<String>>((String day) =>
                          DropdownMenuItem<String>(
                              value: day, child: Text(day)))
                      .toList(),
                  onChanged: (String? newDay) {
                    setState(() {
                      dropdownDay = newDay!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectedTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime = timeOfDay;
      setState(() {
        _timeController.text =
            '${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}';
      });
    }
  }

  // create category record
  _addCategory(Isar isar) async {
    final catagories = isar.categorys;

    final newCategory = Category()..name = _newCatController.text;

    await isar.writeTxn((isar) async {
      await catagories.put(newCategory);
    });

    _newCatController.clear();
  }
}
