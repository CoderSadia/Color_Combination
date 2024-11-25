import 'package:flutter/material.dart';

class ColorDisplayScreen extends StatefulWidget {
  const ColorDisplayScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorDisplayScreenState createState() => _ColorDisplayScreenState();
}

class _ColorDisplayScreenState extends State<ColorDisplayScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  Color _textColor = Colors.black;

  // Map to match color names to Flutter Colors
  final Map<String, Color> _colorMap = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'black': Colors.black,
    'white': Colors.white,
    'purple': Colors.purple,
    'orange': Colors.orange,
    'pink': Colors.pink,
    'brown': Colors.brown,
    'cyan': Colors.cyan,
  };

  void _updateTextColor() {
    String colorInput = _colorController.text.trim().toLowerCase();
    setState(() {
      _textColor = _colorMap[colorInput] ?? Colors.black; // Default to black
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name & Color Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(
                labelText: 'Enter a color name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) =>
                  _updateTextColor(), // Update color dynamically
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                _nameController.text.isEmpty
                    ? 'Your name will appear here'
                    : _nameController.text,
                style: TextStyle(fontSize: 24, color: _textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
