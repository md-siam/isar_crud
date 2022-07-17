import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'create_routine_page.dart';
import '/app/collections/routine.dart';

class HomePage extends StatefulWidget {
  final Isar isar;
  const HomePage({
    Key? key,
    required this.isar,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Routine>? routines;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _readRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Routine'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateRoutinePage(isar: widget.isar),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              controller: null,
              child: Column(
                children: _buildWidgets(),
              ),
            ),
    );
  }

  List<Widget> _buildWidgets() {
    List<Widget> x = [];

    for (int i = 0; i < routines!.length; i++) {
      x.add(
        Card(
          elevation: 4.0,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    routines![i].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.schedule,
                              size: 16,
                            ),
                          ),
                          TextSpan(text: " ${routines![i].startTimeRoutine}")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.calendar_month,
                              size: 16,
                            ),
                          ),
                          TextSpan(text: " ${routines![i].day}")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      );
    }
    return x;
  }

  _readRoutines() async {
    final routineCollection = widget.isar.routines;
    final getRoutines = await routineCollection.where().findAll();

    setState(() {
      routines = getRoutines;
      isLoading = false;
    });
    // print(routines![0].title);
    // print(routines![0].startTimeRoutine);
    // print(routines!.length);
  }
}
