import 'package:app_load_testing_ag/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'World Time Data',
          style:
              GoogleFonts.alice(letterSpacing: 3, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: 'Start :',
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            BigText(text: 'Finished: ', color: Colors.black)
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
    );
  }
}
