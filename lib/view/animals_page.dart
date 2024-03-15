import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siec/controller/controller.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animals'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Center(child: Icon(CupertinoIcons.dial_fill)),
              ),
              title: Text(animals[index].name),
              subtitle: Text("Food: ${animals[index].food}"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewDetails(animal: animals[index]))),
            );
          }),
    );
  }
}


class ViewDetails extends StatelessWidget {
  final Animal animal;
  const ViewDetails({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            button(title: "Food:", subtitle: animal.food),
            const SizedBox(height: 5),
            button(title: "Habit:", subtitle: animal.habitat),
            const SizedBox(height: 5),
            button(title: "Average Age:", subtitle: animal.lifespan),
            const SizedBox(height: 5),
            button(title: "About:", subtitle: animal.description),
          ],
        ),
      ),
    );
  }
  Widget button({required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.normal)),
        const SizedBox(width: 10),
        Expanded(child: Text(subtitle, maxLines: 2, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.blue))),
      ],
    );
  }
}

