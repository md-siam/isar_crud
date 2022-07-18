import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_crud/app/pages/home_page.dart';

import '/app/collections/category.dart';
import '/app/collections/routine.dart';

class UpdateRoutinePage extends StatefulWidget {
  final Isar isar;
  final Routine routine;
  const UpdateRoutinePage({
    Key? key,
    required this.isar,
    required this.routine,
  }) : super(key: key);

  @override
  State<UpdateRoutinePage> createState() => _UpdateRoutinePageState();
}

class _UpdateRoutinePageState extends State<UpdateRoutinePage> {
  List<Category>? categories;
  Category? dropdownValue;
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
  void initState() {
    super.initState();
    _setRoutineInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Routine'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Delete Routine'),
                  content: const Text(
                      'Are you sure you want to delete this routine?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        deleteRoutine();
                      },
                      child: const Text('Yes'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
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
                          ?.map<DropdownMenuItem<Category>>(
                              (Category newValue) => DropdownMenuItem<Category>(
                                  value: newValue, child: Text(newValue.name)))
                          .toList(),
                      onChanged: (Category? newValue) {
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
                                  Navigator.pop(context);
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
                  onPressed: () {
                    updateRoutine();
                  },
                  child: const Text('Update'),
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
    _readCategory();
  }

  _readCategory() async {
    final categoryCollection = widget.isar.categorys;
    final getCategories = await categoryCollection.where().findAll();

    setState(() {
      dropdownValue = null;
      categories = getCategories;
    });
  }

  _setRoutineInfo() async {
    await _readCategory();
    _titleController.text = widget.routine.title;
    _timeController.text = widget.routine.startTimeRoutine;
    dropdownDay = widget.routine.day;
    //await widget.routine.category.load(); // does not work
    int getId = widget.routine.id;
    //print(getId);

    setState(() {
      dropdownValue = categories?[getId - 1];
    });
  }

  updateRoutine() async {
    final routineCollection = widget.isar.routines;
    await widget.isar.writeTxn((isar) async {
      final routine = await routineCollection.get(widget.routine.id);

      routine!
        ..title = _titleController.text
        ..startTimeRoutine = _timeController.text
        ..day = dropdownDay
        ..category.value = dropdownValue;

      await routineCollection.put(routine);

      Navigator.pop(context);
    });
  }

  deleteRoutine() async {
    final routineCollection = widget.isar.routines;

    await widget.isar.writeTxn((isar) async {
      routineCollection.delete(widget.routine.id);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(isar: widget.isar)),
    );
  }
}
