import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String companyName = "Google";
  int empCount = 500;

  @override
  Widget build(BuildContext context) {
    return Company(
        companyName: companyName,
        empCount: empCount,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Inherited widget"),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[400],
            ),
            body: Column(children: [
              const SizedBox(
                height: 70,
              ),
              const CompanyData(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    companyName = "NVIDIA";
                    empCount++;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[600]),
                child: const Text("Change Data"),
              )
            ]),
          ),
        ));
  }
}

class CompanyData extends StatelessWidget {
  const CompanyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(10),
           color: Colors.blueGrey[200], child: Row(
             children: [
               const Text("Company name: ") ,
               Text(Company.of(context).companyName, style: const TextStyle(fontWeight: FontWeight.w600),),
             ],
           )),
        const SizedBox(
          width: 20,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
             color: Colors.blueGrey[200]
          ),
          child: Row(
            children: [
              const Text("Employee count: ") ,
              Text("${Company.of(context).empCount}", style: const TextStyle(fontWeight: FontWeight.w600),),
            ],
          ))
      ],
    );
  }
}

class Company extends InheritedWidget {
  final String companyName;
  final int empCount;

  const Company({super.key, required this.companyName, required this.empCount, required super.child});

  static Company of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Company>()!;
  }

  @override

  bool updateShouldNotify(Company oldWidget) {
    return companyName != oldWidget.companyName || empCount != oldWidget.empCount;
  }
}
