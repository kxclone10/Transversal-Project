import 'package:demo/Interne1.dart';
import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Externe1.dart';

// ignore: constant_identifier_names
class Transfert1 extends StatelessWidget{
  const Transfert1({Key? key}) : super(key: key);

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
              context, MaterialPageRoute(builder: (context) => const Param1()));
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
          tooltip: 'photo de profil',
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
      height: 150,
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
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Transfert1()));
                /*
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement ...')),
                  );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Transfert1()));
                }*/
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
                onPrimary: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(200, 70), //////// HERE
              ),
              child: const Text(
                'Externe',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Interne1()));
                /*
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement...')),
                  );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Interne1()));
                }*/
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(0xFF,0xFF,0xFF,0xFF),
                onPrimary: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
                shadowColor: Colors.blueAccent,
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 70), //////// HERE
              ),
              child: const Text(
                'Interne',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),

          ],
        ),
      ),
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
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 130.0,
                  width: 130.0,
                  child: IconButton(
                    padding: const EdgeInsets.only(right: 5),
                    icon:Image.asset('images/OM.png'),
                    tooltip: 'par Orange Money',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Externe1())
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: IconButton(
                    padding: const EdgeInsets.only(right: 5),
                    icon: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 120,
                      child: CircleAvatar(
                        radius: 116,
                        backgroundImage: AssetImage('images/wave.png'),
                      ),
                    ),
                    tooltip: 'par Wave',
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Externe1())
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 130.0,
                        width: 130.0,
                        child: IconButton(
                          padding: const EdgeInsets.only(top: 20),
                          icon: Image.asset('images/mastercard.png'),
                          tooltip: 'par Compte Bancaire',
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => Externe1())
                            );
                          },
                        ),
                      ),
                    ]
                ),
              ],
            )
          ],
        )
      ),
    );
  }

}












