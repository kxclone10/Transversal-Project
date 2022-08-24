import 'package:demo/Transfert1.dart';
import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Externe2.dart';

// ignore: constant_identifier_names
class Externe1 extends StatelessWidget{
  const Externe1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // LogoSection(),
            OutputSection(),
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
              context, MaterialPageRoute(builder: (context) => const Transfert1()));
        },
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
          tooltip: 'photo de profile',
          onPressed: () {},
        ),
      ],
      backgroundColor: const Color.fromARGB(0xFF,0x7B,0x61,0xFF),

    );
  }
}


class OutputSection extends StatefulWidget{
  const OutputSection({super.key});

  @override
  MyOutputField createState(){
    return MyOutputField();
  }
}

class MyOutputField extends State<OutputSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(0xFF,0x7B,0x61,0xFF),
            Colors.blueAccent,
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100)),
        ),
      ),
      padding: const EdgeInsets.only(top: 30),

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30,20,0,80),
              height: 80,
              width: 100,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/OM.png'),   // C'est ici qu'il faudra agir pour changer le logo en fonction du choix
                  fit: BoxFit.fill,                                                       // de l'utilisateur
                ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                'Entrez le nom du destinataire',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50,3,50,10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez bien entrer le nom du destinataire';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Email',
                  hintText: 'nom ..',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                'Entrez le numéro $operateur',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(50,3,50,20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir son numéro dans le champ ci-dessus';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Email',
                  hintText: 'numéro ..',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60,30,50,0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Externe2()));
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









