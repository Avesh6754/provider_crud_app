import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_crud_app/provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvidertrue =
        Provider.of<CounterProvider>(context, listen: true);
    CounterProvider counterProviderfalse =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 50,
              width: 120,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text('Total: ${counterProvidertrue.totalcount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 50,
                width: 120,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('180 x ${counterProvidertrue.round}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black26.withOpacity(0.3),
                        child: Text(
                          counterProvidertrue.counter.toString(),
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                      onTap: () {
                        counterProviderfalse.restartcounter();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(radius: 40,child: Icon(Icons.restart_alt),),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        counterProviderfalse.decrementcounter();
                      },
                      child: CircleAvatar(
                        radius: 40,
                        child: Text('-1'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(onTap: () {
                      counterProviderfalse.incrementcounter();
                      counterProviderfalse.counterround();
                      counterProviderfalse.totalcounting();
                    },child: CircleAvatar(radius: 40, child: Text('+1'))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
