import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'depot1.dart';

// ignore: constant_identifier_names
class Depot5 extends StatelessWidget{
  const Depot5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar:MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
    String montant = '25 000';                              // C'est ici qu'il faut récupérer le montant
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5,150,5,5),
              child:  Text(
                'Votre transfert de $montant FCFA a bien réussi !',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50,20,50,100),
              child: Icon(
                Icons.check_circle,
                color: Color.fromARGB(0xFF,0x00,0x01,0x4F),
                size: 100.0,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(50,50,50,0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transfert terminé')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const Depot1()));
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
                  'Terminer',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        )
    );
  }
}

/*
class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChangerCode2()));
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}*/