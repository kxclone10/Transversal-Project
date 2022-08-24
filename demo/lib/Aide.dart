import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
class Help extends StatelessWidget{
  const Help({Key? key}) : super(key: key);

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
        'Aide',
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
         child: Container(
           width: 250,
           height: 70,
           decoration: ShapeDecoration(
               color: const Color.fromARGB(0xFF,0x00,0x01,0x4F),
               shape: RoundedRectangleBorder (
                   borderRadius: BorderRadius.circular(32.0),
               )
           ),
           child: const Center(
               child: Text(
                   "Nos Contacts",
                 style: TextStyle(color: Colors.white, fontSize: 18),
               )
           ),
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
    final List infoList = [
      {
        'label': 'Numéro',
        'info' : '00221 XXX XX XX'
      },
      {
        'label': 'Mail',
        'info' : 'myMoney@gmail.com'
      },
      {
        'label': 'Site Web',
        'info' : 'www.myMoney.sn'
      },
    ];
    return Container(
      child: Column(
        children: infoList.map((hotel) {
          return InfoItems(hotel);
        }).toList(),
      ),
    );
  }

}

class InfoItems extends StatelessWidget {
  final Map infoData;
  InfoItems(this.infoData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 50, 0, 0),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child:  Text(
                  infoData['label'],
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(150, 5, 0,10),
            child:Align(
              alignment: Alignment.centerLeft,
              child:  Text(
                infoData['info'],
                style: const TextStyle(
                  fontSize: 17,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(0xFF,0x00,0x01,0x4F),
                        offset: Offset(0, -10))
                  ],
                  color: Colors.transparent,
                  decoration:
                  TextDecoration.underline,
                  decorationColor: Color.fromARGB(0xFF,0x00,0x01,0x4F),
                  decorationThickness: 1,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
















