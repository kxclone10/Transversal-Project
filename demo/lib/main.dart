import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Inscription2.dart';
// ignore: constant_identifier_names
const d_blue = Color(0x002670C6);
void main(){
    runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Money App',
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoSection(),
            InputSection(),
            //SubmitSection(),
          ],
        ),
      ),
    );
  }
}
class InputSection extends StatefulWidget{
  const InputSection({super.key});

  @override
  MyInputField createState(){
    return MyInputField();
  }
}


class MyInputField extends State<InputSection>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                  'Entrez votre numéro',
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50,10,50,0),
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre numéro';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Email',
                  hintText: 'telephone ..',
                ),
            ),
          ),
          Padding(
                padding: const EdgeInsets.fromLTRB(50,100,50,0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Traitement...')),
                      );
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Code()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
                    onPrimary: Colors.white,
                    shadowColor: Colors.blueAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(400, 50), //////// HERE
                  ),
                  child: const Text(
                      'Suivant',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
          ),
        ],
      )
    );
  }
}

class LogoSection extends StatelessWidget{
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30,80,0,80),
            height: 90,
            width: 110,
            decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      )
    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text(
        'Inscription',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}










