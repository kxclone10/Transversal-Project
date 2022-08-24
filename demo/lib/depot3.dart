import 'package:demo/Connexion2.dart';
import 'package:demo/depot2.dart';
import 'package:demo/depot4.dart';
import 'package:demo/parametre1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
class Depot3 extends StatelessWidget{
  const Depot3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InfoSection(),
            InputSection(),
            // EnterOTP(),
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
              padding: const EdgeInsets.fromLTRB(50,0,0,30),
              child:  Text(
                'Un code de validation a été envoyé, veuillez le saisir',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,50,0),
              child: EnterOTP(),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(50,50,50,0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const Depot4()));
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

            Padding(
              padding: const EdgeInsets.fromLTRB(200,30,30,0),
              child: InkWell(
                  child: const Text(
                    'Renvoyer SMS',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>const Depot3()));  // avec la fonction qu'il faudra utiliser pour gérer le
                  }                                                                   // renvoi de SMS
              ),
            )
          ],
        )
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
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30,20,0,50),
              height: 120,
              width: 120,
              child:const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: CircleAvatar(
                  radius: 116,
                  backgroundImage: AssetImage('images/wave.png'),
                ),
              ),
            ),
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
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        onPressed:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Depot2()));
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




class EnterOTP extends StatelessWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OTPDigitTextFieldBox(first: true, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: true),
            ],
          )
        ]),
      ),
    );
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {Key? key, required this.first, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            //contentPadding: const EdgeInsets.fromLTRB(5,0,2,0),
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(0)),
            hintText: "",
          ),
        ),
      ),
    );
  }
}








