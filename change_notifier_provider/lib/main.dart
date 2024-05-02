import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Info(employeeName: "Atharva", salary: 70000);
      },
      child: const MaterialApp(
        home: MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notifier Provider"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.lightGreen[300], borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    const Text("Employee name: " ),
                    Text(Provider.of<Info>(context).employeeName, style: const TextStyle(fontWeight: FontWeight.w600),) 
                  ],
                ),),
              const SizedBox(
                width: 10,
              ),
               Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.lightGreen[300], borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    const Text("Salary : ") ,
                    Text("${Provider.of<Info>(context).salary}", style: const TextStyle(fontWeight: FontWeight.w600),)
                  ],
                ),),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen[400]),
              onPressed: () {
                Provider.of<Info>(context, listen: false).changeInfo("Rahul", 90000);
              },
              child: const Text("Change Info")),
          const SizedBox(
            height: 20,
          ),
          const NormalClass()
        ],
      ),
    );
  }
}

class NormalClass extends StatelessWidget {
  const NormalClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("This is an example of changeNotifierProvider");
  }
}

class Info extends ChangeNotifier {
  String employeeName;
  int salary;

  Info({required this.employeeName, required this.salary});

  void changeInfo(String employeeName, int salary) {
    this.employeeName = employeeName;
    this.salary = salary;
    notifyListeners();
  }
}
