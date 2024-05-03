import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return Employee(empName: "Atharva", empId: 201);
        }),
        ChangeNotifierProvider(create: (context) {
          return Project(projectName: "Fitness app", devType: "Flutter developer");
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.blueGrey[300],
        title: const Text("Multiprovider Demo"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey[200],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Row(
                    children: [
                      Text(
                        "This is data from Provider class:",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Employee name: ", style: TextStyle(fontSize: 17)),
                      Text(
                        Provider.of<Employee>(context).empName,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text("Employee id: ", style: TextStyle(fontSize: 17)),
                      Text(
                        "${Provider.of<Employee>(context).empId}",
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey[200],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("This is data from changeNotifierProvider: ", style: TextStyle(fontSize: 17)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Project name: ",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      Text(
                        Provider.of<Project>(context).projectName,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text("Developer type: ", style: TextStyle(fontSize: 17)),
                      Text(
                        Provider.of<Project>(context).devType,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[400]),
                  onPressed: () {
                    Provider.of<Project>(context, listen: false).changeProject("CoffeShop App", "Backend developer");
                  },
                  child: const Text("Change Info")),
            )
          ],
        ),
      ),
    );
  }
}

class Project with ChangeNotifier {
  String projectName;
  String devType;

  Project({required this.projectName, required this.devType});

  void changeProject(String projectName, String devType) {
    this.projectName = projectName;
    this.devType = devType;
    notifyListeners();
  }
}

class Employee {
  String empName;
  int empId;

  Employee({required this.empName, required this.empId});
}
