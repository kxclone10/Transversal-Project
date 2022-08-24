import 'package:demo/Interne1.dart';
import 'package:demo/depot2.dart';
import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Externe1.dart';

// ignore: constant_identifier_names
class Depot1 extends StatelessWidget{
  const Depot1({Key? key}) : super(key: key);

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
        'Dépôt',
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
      padding: const EdgeInsets.only(top: 150),
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
                            context, MaterialPageRoute(builder: (context) => const Depot2())
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
                            context, MaterialPageRoute(builder: (context) => const Depot2())
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
                                  context, MaterialPageRoute(builder: (context) => const Depot2())
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












