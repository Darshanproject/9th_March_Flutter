class SeekBarExample extends StatefulWidget {
  @override
  _SeekBarExampleState createState() => _SeekBarExampleState();
}

class _SeekBarExampleState extends State<SeekBarExample> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seek Bar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              value: _sliderValue,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
              min: 0,
              max: 100,
            ),
            Text('Slider Value: $_sliderValue'),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: SeekBarExample()));
