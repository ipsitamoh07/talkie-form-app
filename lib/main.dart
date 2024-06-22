import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInputScreen(),
    );
  }
}

class UserInputScreen extends StatefulWidget {
  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final MethodChannel _channel = MethodChannel('com.example.form_tts/userInput');

  String name = '';
  String addressLine1 = '';
  String city = '';
  String state = '';
  String country = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address Line 1'),
                onSaved: (value) => addressLine1 = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => city = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'State'),
                onSaved: (value) => state = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                onSaved: (value) => country = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _channel.invokeMethod('createVoiceUtterance', {
          'name': name,
          'addressLine1': addressLine1,
          'city': city,
          'state': state,
          'country': country,
        });
      } on PlatformException catch (e) {
        print("Failed to create voice utterance: '${e.message}'.");
      }
    }
  }
}
