import 'package:flutter/material.dart';

class ShapeGame extends StatefulWidget {
  const ShapeGame({super.key});

  @override
  State<ShapeGame> createState() => _ShapeGameState();
}

class _ShapeGameState extends State<ShapeGame> {
  // Track whether each shape is correctly placed
  bool isTrianglePlaced = false;
  bool isCirclePlaced = false;
  bool isRectanglePlaced = false;
  bool isHexagonPlaced = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapes'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Reset the game
                isTrianglePlaced = false;
                isCirclePlaced = false;
                isRectanglePlaced = false;
                isHexagonPlaced = false;
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Place the corresponding shapes in shaded areas',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Drop areas
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDropTarget(
                        shape: 'Triangle',
                        isPlaced: isTrianglePlaced,
                        onAccept: () {
                          setState(() {
                            isTrianglePlaced = true;
                          });
                        },
                        isCircle: false,
                      ),
                      _buildDropTarget(
                        shape: 'Hexagon',
                        isPlaced: isHexagonPlaced,
                        onAccept: () {
                          setState(() {
                            isHexagonPlaced = true;
                          });
                        },
                        isCircle: false,
                      ),
                      _buildDropTarget(
                        shape: 'Circle',
                        isPlaced: isCirclePlaced,
                        onAccept: () {
                          setState(() {
                            isCirclePlaced = true;
                          });
                        },
                        isCircle: true,
                      ),
                      _buildDropTarget(
                        shape: 'Rectangle',
                        isPlaced: isRectanglePlaced,
                        onAccept: () {
                          setState(() {
                            isRectanglePlaced = true;
                          });
                        },
                        isCircle: false,
                      ),
                    ],
                  ),
                ),
                // Draggable shapes
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Draggable<String>(
                        data: 'Triangle',
                        feedback: _buildShape(Colors.yellow, 'Triangle'),
                        child: _buildShape(Colors.yellow, 'Triangle'),
                      ),
                      Draggable<String>(
                        data: 'Hexagon',
                        feedback: _buildShape(Colors.purple, 'Hexagon'),
                        child: _buildShape(Colors.purple, 'Hexagon'),
                      ),
                      Draggable<String>(
                        data: 'Circle',
                        feedback: _buildShape(Colors.red, 'Circle', isCircle: true),
                        child: _buildShape(Colors.red, 'Circle', isCircle: true),
                      ),
                      Draggable<String>(
                        data: 'Rectangle',
                        feedback: _buildShape(Colors.blue, 'Rectangle'),
                        child: _buildShape(Colors.blue, 'Rectangle'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build shapes
  Widget _buildShape(Color color, String label, {bool isCircle = false}) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: color,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Widget to build drop targets
  Widget _buildDropTarget({
    required String shape,
    required bool isPlaced,
    required VoidCallback onAccept,
    required bool isCircle,
  }) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: isPlaced ? Colors.green : Colors.grey.shade300,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(),
          ),
        );
      },
      onAccept: (data) {
        if (data == shape) {
          onAccept();
        }
      },
    );
  }
}
