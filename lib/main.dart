import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Dynamic Carousel Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController numberTxtController = TextEditingController();

  final _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.orange, width: 2.0)
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    numberTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
              child: TextFormField(
                controller: numberTxtController,
                style: TextStyle(color: Colors.blueGrey, fontSize: 18.0, fontWeight: FontWeight.bold),
                obscureText: false,
                onChanged: (value){
                  setState(() {

                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.input, color: Colors.blueGrey,),
                  hintText: "Enter number",
                  labelText: "Enter number",
                  focusedBorder: _inputBorder,
                  enabledBorder: _inputBorder,
                  disabledBorder: _inputBorder,
                ),
              ),
            ),
            MaterialButton(
              color: Colors.orange,
              child: Text('Generate', style: TextStyle(color: Colors.white, fontSize: 17.0),),
              onPressed: () {
                setState(() {
                });
              }
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for(int x =0; x < numberTxtController.text.length; x++)
                      buildCarousel(numberTxtController.text[x])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarousel(String text){
    return Container(
      padding: EdgeInsets.all(6.0),
      color: Colors.white,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 55.0,
            maxWidth: 25.0,
          ),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 45.0,
              initialPage: int.parse(text),
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              autoPlay: true,
              onPageChanged: (value, reason) {
              },
            ),
            itemCount: 10,
            itemBuilder: (ctx, item) => Padding(
              padding: EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  color: Colors.orange,
                ),
                padding: EdgeInsets.all(4.0),
                //color: Colors.orange,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Center(
                    child: Text(
                      item.toString(),
                      style: TextStyle(
                          fontFamily: 'Open Sans Extrabold',
                          fontStyle: FontStyle.normal,
                          fontSize: 4.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
