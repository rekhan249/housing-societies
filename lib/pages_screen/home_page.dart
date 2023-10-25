import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_lists.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/pages_screen/profile_details.dart';
import 'package:housing_society/providers/requestprovider.dart';
import 'package:housing_society/society_service/services_detail_for_user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // NotifikationService notifikationService = NotifikationService();

  List<Service> services = [
    Service(
        name: 'Cleaning',
        imageUrl:
            'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service(
        name: 'Plumber',
        imageUrl:
            'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    Service(
        name: 'Electrician',
        imageUrl:
            'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    Service(
        name: 'Painter',
        imageUrl:
            'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    Service(
        name: 'Carpenter',
        imageUrl: 'https://img.icons8.com/fluency/2x/drill.png'),
    Service(
        name: 'Gardener',
        imageUrl:
            'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
  ];

  List<dynamic> workers = [
    [
      'Alfredo Schafer',
      'Plumber',
      'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
    ],
    [
      'Michelle Baldwin',
      'Cleaner',
      'https://uifaces.co/our-content/donated/oLkb60i_.jpg',
    ],
    [
      'Brenon Kalu',
      'Driver',
      'https://uifaces.co/our-content/donated/VUMBKh1U.jpg',
    ]
  ];
  // @override
  // void initState() {
  //   notifikationService.reqstNotificationPermission();
  //   notifikationService.getDeviceToken().then((value) {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<RequestProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, ProfileDetails.routeName);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
              title:
                  const Text('HomePage', style: TextStyle(color: Colors.black)),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null) {
                    return const Center(child: Text(" Data Doesn't exist"));
                  }
                  final servicesData = snapshot.data!.docs;

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 05.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 05.w, vertical: 05.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 4),
                                  blurRadius: 10.0)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
                                        width: 70.w,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          servicesData[index]["name"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          Text(
                                              servicesData[index]
                                                      ["serviceTypes"]
                                                  .toString(),
                                              style:
                                                  TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 2, 47, 69),
                                                      fontSize: 15.sp)),
                                          SizedBox(width: 20.w),
                                          Text(
                                              '\$${servicesData[index]["hourlyRate"]}',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15.sp)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ServicesDetailsForUsers(
                                              serviceId: servicesData[index].id,
                                              servicesDetailsForUsers:
                                                  ServiceModel(
                                                sid: servicesData[index]['sid'],
                                                name: servicesData[index]
                                                    ['name'],
                                                phoneNumber: servicesData[index]
                                                    ['phoneNumber'],
                                                email: servicesData[index]
                                                    ['email'],
                                                address: servicesData[index]
                                                    ['address'],
                                                serviceTypes:
                                                    servicesData[index]
                                                        ['serviceTypes'],
                                                hourlyRate: servicesData[index]
                                                    ['hourlyRate'],
                                                desc: servicesData[index]
                                                    ['desc'],
                                              ),
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 3, 70, 125),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                        child: Text('View Profile',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Categories',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null) {
                    return const Center(child: Text(" Data Doesn't exist"));
                  }

                  // final servicesData = snapshot.data!.docs;
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 235.h,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.blue.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.network(services[index].imageUrl,
                                        height: 50),
                                    SizedBox(height: 10.h),
                                    Text(
                                      services[index].name,
                                      style: TextStyle(fontSize: 14.sp),
                                    )
                                  ]),
                            ),
                          );
                        }),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Rated',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null) {
                    return const Center(child: Text(" Data Doesn't exist"));
                  }
                  final servicesData = snapshot.data!.docs;

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: AspectRatio(
                            aspectRatio: 3.5,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 05.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 05.w, vertical: 05.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                            'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
                                            width: 70.w)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          servicesData[index]["name"],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          servicesData[index]["serviceTypes"],
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ServicesDetailsForUsers(
                                                    serviceId:
                                                        servicesData[index].id,
                                                    servicesDetailsForUsers:
                                                        ServiceModel(
                                                      sid: servicesData[index]
                                                          ['sid'],
                                                      name: servicesData[index]
                                                          ['name'],
                                                      phoneNumber:
                                                          servicesData[index]
                                                              ['phoneNumber'],
                                                      email: servicesData[index]
                                                          ['email'],
                                                      address:
                                                          servicesData[index]
                                                              ['address'],
                                                      serviceTypes:
                                                          servicesData[index]
                                                              ['serviceTypes'],
                                                      hourlyRate:
                                                          servicesData[index]
                                                              ['hourlyRate'],
                                                      desc: servicesData[index]
                                                          ['desc'],
                                                    ),
                                                  ),
                                                ));
                                          },
                                          child: Container(
                                            height: 30.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 3, 70, 125),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Center(
                                              child: Text('View Details',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 05.h),
                                        GestureDetector(
                                          onTap: () {
                                            Provider.of<RequestProvider>(
                                                    context,
                                                    listen: false)
                                                .requestSubmission(context,
                                                    servicesId:
                                                        servicesData[index].id,
                                                    servicesPro: ServiceModel(
                                                      sid: servicesData[index]
                                                          ['sid'],
                                                      name: servicesData[index]
                                                          ['name'],
                                                      phoneNumber:
                                                          servicesData[index]
                                                              ['phoneNumber'],
                                                      email: servicesData[index]
                                                          ['email'],
                                                      address:
                                                          servicesData[index]
                                                              ['address'],
                                                      serviceTypes:
                                                          servicesData[index]
                                                              ['serviceTypes'],
                                                      hourlyRate:
                                                          servicesData[index]
                                                              ['hourlyRate'],
                                                      desc: servicesData[index]
                                                          ['desc'],
                                                    ));
                                          },
                                          child: Container(
                                            height: 30.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 3, 70, 125),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Center(
                                              child: Text('Service Avail',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      });
                },
              ),
              SizedBox(height: 20.h),
            ]))));
  }
}
