import 'package:flutter/material.dart';
import 'package:zylu/models/employee_data.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List allEmployees = employeeData.toList();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView.builder(
        itemCount: allEmployees.length,
        padding: const EdgeInsets.all(12),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 1, 
                  child: Text("${allEmployees[index]['e_id'].toString()}.",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 1, 2, 52)
                    ),
                  ),
                ),
                Expanded(
                  flex: 10, 
                  child: Text(
                    allEmployees[index]['e_name'],
                      style: TextStyle(
                        fontSize: 18,
                        color: allEmployees[index]['e_joined_year'] > 5 && allEmployees[index]['e_active']
                        ? const Color.fromARGB(255, 24, 157, 28)
                        : const Color.fromARGB(255, 255, 17, 0)
                      ),
                  ),
                ),
                Expanded(
                  flex: 1, 
                  child: allEmployees[index]['e_active'] == true
                  ? const Icon(
                      Icons.circle, 
                      color: Color.fromARGB(255, 58, 234, 64),
                      size: 12,
                    )
                  : Container()
                ),
              ]
            ),
          );
        }),
      )  
    );
  }
}