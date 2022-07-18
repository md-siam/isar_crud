import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '/app/collections/routine.dart';
import 'create_routine_page.dart';
import 'update_routine_page.dart';

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
  final TextEditingController _searchController = TextEditingController();
  bool searching = false;

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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: searchRoutineByName,
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                        hintText: 'Search routine..',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 5.0),
                  FutureBuilder<List<Widget>>(
                    future: _buildWidgets(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Future<List<Widget>> _buildWidgets() async {
    // this will load the data again
    if (!searching) {
      await _readRoutines();
    }

    List<Widget> x = [];

    for (int i = 0; i < routines!.length; i++) {
      x.add(
        Card(
          elevation: 4.0,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateRoutinePage(
                    isar: widget.isar,
                    routine: routines![i],
                  ),
                ),
              );
            },
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

  searchRoutineByName(String searchName) async {
    searching = true;
    final routineCollection = widget.isar.routines;
    final searchResults =
        await routineCollection.filter().titleContains(searchName).findAll();

    setState(() {
      routines = searchResults;
      isLoading = false;
    });
  }
}
