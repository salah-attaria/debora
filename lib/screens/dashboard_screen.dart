import 'package:flutter/material.dart';

import 'package:debora/services/hive_service.dart';
import 'students/students_screen.dart';
import 'package:debora/widgets/custom_app_bar.dart';
import 'package:debora/widgets/stats_card.dart';

class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final totalStudents = HiveService.getStudents().length;
    

    return Scaffold(

  appBar: const CustomAppBar(
    title: "Debora School",
  ),
      body: Padding(

        padding: const EdgeInsets.all(16),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [


            const Text(

              "Welcome 👋",

              style: TextStyle(

                fontSize: 30,

                fontWeight: FontWeight.bold,

                color: Color(0xff015254),

              ),

            ),



            const SizedBox(height: 8),



            const Text(

              "School Management Dashboard",

              style: TextStyle(

                color: Colors.grey,

                fontSize: 16,

              ),

            ),



            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child:StatsCard(
                    title: "Students",
                    value: totalStudents.toString(),
                    icon: Icons.school,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatsCard(
                    title: "Teachers",
                    value: "18",
                    icon: Icons.badge,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),



            Expanded(

              child: GridView.count(


                crossAxisCount: 2,


                mainAxisSpacing: 18,


                crossAxisSpacing: 18,



                children: [



                  DashboardCard(

                    title: "Students",

                    icon: Icons.school,


                    onTap: () {


                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              const StudentsScreen(),

                        ),

                      );


                    },

                  ),




                  DashboardCard(

                    title: "Attendance",

                    icon: Icons.calendar_month,


                    onTap: () {},

                  ),




                  DashboardCard(

                    title: "Teachers",

                    icon: Icons.badge,


                    onTap: () {},

                  ),





                  DashboardCard(

                    title: "Fees",

                    icon: Icons.account_balance_wallet,


                    onTap: () {},

                  ),





                  DashboardCard(

                    title: "Exams",

                    icon: Icons.assignment,


                    onTap: () {},

                  ),





                  DashboardCard(

                    title: "Reports",

                    icon: Icons.bar_chart,


                    onTap: () {},

                  ),



                ],


              ),

            ),


          ],


        ),

      ),

    );

  }

}






class DashboardCard extends StatefulWidget {


  final String title;

  final IconData icon;

  final VoidCallback onTap;



  const DashboardCard({

    super.key,

    required this.title,

    required this.icon,

    required this.onTap,

  });



  @override

  State<DashboardCard> createState() =>
      _DashboardCardState();

}







class _DashboardCardState extends State<DashboardCard> {


  bool pressed = false;




  @override

  Widget build(BuildContext context) {


    return GestureDetector(


      onTapDown: (_) {


        setState(() {

          pressed = true;

        });


      },



      onTapUp: (_) {


        setState(() {

          pressed = false;

        });



        widget.onTap();


      },



      onTapCancel: () {


        setState(() {

          pressed = false;

        });


      },



      child: AnimatedScale(


        scale: pressed ? 0.92 : 1,



        duration:

            const Duration(milliseconds: 120),




        child: Container(



          decoration: BoxDecoration(



            color: Colors.white,




            borderRadius:

                BorderRadius.circular(22),




            border: Border.all(



              color:

                  const Color(0xffFACC15),



              width: 2,



            ),





            boxShadow: [



              BoxShadow(



                color:

                    Colors.black.withOpacity(0.08),



                blurRadius: 12,



                offset:

                    const Offset(0, 6),



              ),



            ],



          ),





          child: Column(



            mainAxisAlignment:

                MainAxisAlignment.center,




            children: [





              Icon(



                widget.icon,



                size: 50,



                color:

                    const Color(0xff015254),



              ),






              const SizedBox(height: 15),





              Text(



                widget.title,




                style: const TextStyle(



                  color:

                      Color(0xff015254),



                  fontSize: 18,



                  fontWeight:

                      FontWeight.bold,



                ),



              ),





            ],



          ),



        ),



      ),



    );

  }

}