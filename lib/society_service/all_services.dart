import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = '/services';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 5, 78, 139),
        title: Text(
          'Servies',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: 05,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 185, 10, 86),
                        elevation: 5,
                        child: CircleAvatar(
                          radius: 70.r,
                          child: Image.asset('assets/images/discovery.png'),
                        ),
                      ),
                      Text('Discovery',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              } else if (index == 1) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          color: const Color.fromARGB(255, 185, 10, 86),
                          elevation: 5,
                          child: CircleAvatar(
                              radius: 70.r,
                              child: Image.asset(
                                  'assets/images/distributed.png'))),
                      Text('Distributed',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              } else if (index == 2) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          color: const Color.fromARGB(255, 185, 10, 86),
                          elevation: 5,
                          child: CircleAvatar(
                              radius: 70.r,
                              child: Image.asset('assets/images/explore.png'))),
                      Text('Explore',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              } else if (index == 3) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ServicesScreen.routeName);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          color: const Color.fromARGB(255, 185, 10, 86),
                          elevation: 5,
                          child: CircleAvatar(
                              radius: 70.r,
                              child: Image.asset('assets/images/service.png'))),
                      Text('Service',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              } else if (index == 4) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          color: const Color.fromARGB(255, 185, 10, 86),
                          elevation: 5,
                          child: CircleAvatar(
                              radius: 70.r,
                              child:
                                  Image.asset('assets/images/debitcard.png'))),
                      Text('Debitcard',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
