import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/list_update_provider.dart';
import '../utils/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ListUpdateProvider ProviderFalse =
        Provider.of<ListUpdateProvider>(context, listen: false);
    ListUpdateProvider ProviderTrue =
        Provider.of<ListUpdateProvider>(context, listen: true);
    return Scaffold(
      body: Column(
    mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                ProviderFalse.listUpdate(value);
              },
              itemCount: screensList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(
                                  '${ProviderTrue.onboardindlist[index]!.image}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${ProviderTrue.onboardindlist[index]!.name}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${ProviderTrue.onboardindlist[index]!.label}',
                        style: const TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          (ProviderTrue.currentindex==ProviderTrue.onboardindlist.length-1)? GestureDetector(
            onTap: () {
              ProviderFalse.lastPage();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.orange
              ),
              alignment: Alignment.center,
              child: Text('Get Started',style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 25),),
            ),
          ):
          SizedBox(height: 20,),
          Container(
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  ProviderTrue.onboardindlist.length, (index) => Indicatorcolor(index: index,)),
            ),
          ),
          SizedBox(height: 30,),


        ],
      ),
    );
  }
}

class Indicatorcolor extends StatelessWidget {
  const Indicatorcolor({
    super.key,
    required this.index,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
                    height:  (Provider.of<ListUpdateProvider>(context,listen: true).currentindex==index)?13:10,
                    width: (Provider.of<ListUpdateProvider>(context,listen: true).currentindex==index)?13:10,
                    margin: EdgeInsets.only(right: 10,bottom: 30),
                    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color:  (Provider.of<ListUpdateProvider>(context,listen: true).currentindex==index)?Colors.orange:Colors.grey
                    ),
                  );
  }
}
