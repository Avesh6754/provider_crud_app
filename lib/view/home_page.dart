import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BackgroundProvider providertrue =
        Provider.of<BackgroundProvider>(context, listen: true);
    BackgroundProvider providerfalse =
        Provider.of<BackgroundProvider>(context, listen: false);
    providerfalse.homebackground();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Background',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              providertrue.backgroundlist.length,
              (index) => Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(right: 12, left: 12, top: 12),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black26, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(
                            providertrue.backgroundlist[index].banner),
                        colorFilter: const ColorFilter.srgbToLinearGamma(),
                        fit: BoxFit.cover)),
                alignment: Alignment.center,
                child: Text(
                  '${providertrue.backgroundlist[index].name}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 1.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
