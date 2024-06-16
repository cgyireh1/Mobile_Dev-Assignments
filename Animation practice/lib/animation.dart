import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        // The scaffold is the root widget of the application
        home: Scaffold(
      // The AppBar is a widget that appears at the top of the screen, more like the header
      appBar: AppBar(
        title: const Text('Lenas World'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(icon: Icon(Icons.directions_car)),
        //     Tab(icon: Icon(Icons.directions_transit)),
        //     Tab(icon: Icon(Icons.directions_bike)),
        //   ],
        // ),
      ),
      body: const Center(
        child: Text('Welcome To Lena s World😊',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      // A button that launches a SnackBar when pressed at the  button of the screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // child: const Icon(Icons.add),
        child: Text('Hey'),
        backgroundColor: Colors.pink,
      ),
    )));