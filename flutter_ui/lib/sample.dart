import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FlutterUIApp()));
}

class FlutterUIApp extends StatelessWidget {
  const FlutterUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Where you'll sleep"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [
              Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                      Icons.people, 
                      size: 20.0, 
                      color: Colors.grey
                      ),
                      Text("Maximum occupancy"),
                      Text(
                        "2 adults",
                        style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                    )
                    ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                      Icons.bed, 
                      size: 20.0, 
                      color: Colors.grey
                      ),
                      Text("Where you'll sleep"),
                      Text(
                        "1 king bed",
                        style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                    )
                    ),
                    ],
                  ),
                ),
              ),
            ]
            ),
          ),
          Text(
            "Room features",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ) ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.curtains,
                    size: 20.0,
                  ),
                  Text(
                    "Custom Black Out Curtains"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.desk,
                    size: 20.0,
                  ),
                  Text(
                    "Antique Writing Desk and Chair"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.room,
                    size: 20.0,
                  ),
                  Text(
                    "In-Room Safe"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.tv,
                    size: 20.0,
                  ),
                  Text(
                    "Smart TV"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.bathroom,
                    size: 20.0,
                  ),
                  Text(
                    "Entique Bathroom with Toto Heated Toilet"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.microwave_rounded,
                    size: 20.0,
                  ),
                  Text(
                    "Full-length Mirror"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.window,
                    size: 20.0,
                  ),
                  Text(
                    "Window Seat"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.shower,
                    size: 20.0,
                  ),
                  Text(
                    "Aesop Bathroom Toiletries"
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.call,
                    size: 20.0,
                  ),
                  Text(
                    "Matouk Towels and Robes"
                    ),
                ],
              ),
        ]
        )
        ],
      ),
    );
  }
}
