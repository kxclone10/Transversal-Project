import 'package:demo/Externe3.dart';
import 'package:demo/Interne2.dart';
import 'package:demo/Interne4.dart';
import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
class Interne3 extends StatelessWidget{
  const Interne3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // LogoSection(),
            InfoSection(),
            InputSection(),
          ],
        ),
      ),
    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        onPressed:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Interne2()));
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'Transfert',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(right: 5),
          icon: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 22,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/femme.jpg'),
            ),
          ),
          tooltip: 'photo de profil',
          onPressed: () {},
        ),
      ],
      backgroundColor: const Color.fromARGB(0xFF,0x7B,0x61,0xFF),

    );
  }
}


class InfoSection extends StatefulWidget{
  const InfoSection({super.key});

  @override
  MyInfoField createState(){
    return MyInfoField();
  }
}

class MyInfoField extends State<InfoSection> {
  final _formKey = GlobalKey<FormState>();
  String profilepic = 'images/ab.png';
  String profilename = 'Abdou SAKHO';
  String tel = '77 000 00 00';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              margin: const EdgeInsets.fromLTRB(30,20,0,50),
              height: 80,
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(profilepic.toString()),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
              child: Column(
                children: [
                  Text(
                    profilename,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(0xFF,0x42,0xA2,0xE7),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    tel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
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
    String operateur = 'Orange Money';
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:  Text(
                'Saisir Montant',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150,10,150,50),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le montant pour procéder au transfert';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  suffix: Text('FCFA'),
                  fillColor: Color.fromARGB(0xFF,0xE4,0xF2,0xFB),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  //labelText: 'Email',
                  hintText: 'montant..',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60,30,50,0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Traitement...')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Interne4()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
                  onPrimary: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(400, 50), //////// HERE
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









