import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:newtrinetra/camerapage.dart';
import 'package:newtrinetra/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRINETRA',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: h/12,
        
      ),
      body: Column(children: [
        SizedBox( 
                    height:(h/2)-53, 
                     width:double.infinity,
            child: ElevatedButton(
                  child: const Text('OBJECT DETECTION'),
                  onPressed: ()async{
                    await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>CameraPage(cameras: value,))));
                  },
                  
                  style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 0, 0),)
            ),
            ),
            SizedBox( 
                height:(h/2)-53, 
                 width:double.infinity,
            child: ElevatedButton(
              child: const Text('CURRENCY DETECTION'),
              onPressed: ()async{
                await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>CameraPage(cameras: value,))));
              },
              style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 58, 57, 57),)
            ),
            ),

      ],)
      
    );
  }
}

