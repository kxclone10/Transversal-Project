import 'package:demo/Connexion1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Inscription2.dart';
// ignore: constant_identifier_names

class Inscription extends StatelessWidget{  //  Je suis ici, c'est ce que je devrai continuer après
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar:MyAppBar(),
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
                'Prénom',
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
                    return 'Veuillez entrer votre Prénom';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Email',
                  hintText: 'Prénom ..',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                'Nom',
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
                    return 'Veuillez entrer votre Nom';
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
                'Saisir votre code secret',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,30,0),
              child: EnterOTP(),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50),
              child:  Text(
                'Confirmer le code secret',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,2,30,0),
              child: EnterOTP(),
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
                        context, MaterialPageRoute(builder: (context) => Connexion1()));
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

class LogoSection extends StatelessWidget{
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25,30,0,10),
              height: 60,
              width: 60,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.fill,
                  )
              ),
            )
          ],
        )
    );
  }
}











