import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_project/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

class PopularProducts extends StatefulWidget
{
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> 
{

  var jasonList=[];


  @override
  void initState() {
    
    super.initState();
    getData();
  }

 void getData() async
 {
    try{
      var response = await Dio().get('https://dummyjson.com/products');
      
      if(response.statusCode == 200 )
      {
        jasonList = response.data["products"] as List;
        //print(response.data);
        if(this.mounted)
        {
          setState(() {
            //jasonList = response.data["products"] as List;
            print(jasonList);
          });
        }
      }
      else{
        print(response.statusCode);
      }
    }
    catch(e){
      print(e);
    }
 }

  @override
  Widget build(BuildContext context)
  {
    return 
    jasonList.isNotEmpty?
        Expanded(
          child: Container(
            
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.all((2 / 375.0) * MediaQuery.of(context).size.width),
            //  decoration: BoxDecoration(
            //    //color:const Color(0xFF979797).withOpacity(0.1),
            //    borderRadius: BorderRadius.circular(15),
            //    ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: jasonList.length,
              itemBuilder: (context, index) {
                return 
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: (20 / 375.0) * MediaQuery.of(context).size.width),
                      child: SizedBox(
                        width: (140 / 375.0) * MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.02,
                              child: Container(
                              padding: EdgeInsets.all((20 / 375.0) * MediaQuery.of(context).size.width),
                                           decoration: BoxDecoration(
                               color:const Color(0xFF979797).withOpacity(0.1),
                               borderRadius: BorderRadius.circular(15),
                                           ),
                               child: Image.network(jasonList[index]['images'][0]??"https://i.dummyjson.com/data/products/1/1.jpg",
                                     fit: BoxFit.fill,
                                )
                               ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                             jasonList[index]["title"],
                             style:const TextStyle(
                               color: Colors.black,
                             ),
                             maxLines: 1,
                           ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                 "\$${jasonList[index]["price"].toString()}",
                             style:const TextStyle(
                               color: Color.fromARGB(255, 184, 96, 56),
                             ),
                             ),

                             Container(
                                 padding: EdgeInsets.all((8 / 375.0) * MediaQuery.of(context).size.width),
                                 width: (28 / 375.0) * MediaQuery.of(context).size.width,
                                 height: (28 / 375.0) * MediaQuery.of(context).size.width,
                                 decoration: BoxDecoration(
                                   color:const Color(0xFF979797).withOpacity(0.1),
                                   shape: BoxShape.circle,
                                 ),
                                 child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
                               ),
                              ],
                           ),

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          )//ListView.builder(
           // shrinkWrap: true,
           // scrollDirection: Axis.horizontal,
           // itemBuilder: (BuildContext context, int index){
           //   print(jasonList[index]["title"]);
           //   return Card(
           //     child: ListTile(
           //       // leading: ClipRRect(
           //       //   borderRadius: BorderRadius.circular(50),
           //       //   child: Image.network(jasonList[index]['images'][0]??"https://i.dummyjson.com/data/products/1/1.jpg",
           //       //          fit: BoxFit.fill,
           //       //          width: 50,
           //       //          height: 50,
           //       //   ),
           //       // ),
           //        title: Text(jasonList[index]['title']??"farah"),
           //       // subtitle: Text(jasonList[index]['description']??"at haga"),
           //     ),
           //   );
           // },
           // itemCount: jasonList.isEmpty? 0:jasonList.length,
         // ),
        ):Center(
          child: CircularProgressIndicator(color: Colors.black12),
        );
    }
}
    // SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: [
    //       // start of the first card
    //       Padding(
    //         padding:  EdgeInsets.only(left: (20 / 375.0) * MediaQuery.of(context).size.width),
    //         child: SizedBox(
    //                   width: (140 / 375.0) * MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       AspectRatio(
    //                         aspectRatio: 1.02,
    //                         child: Container(
    //                           padding: EdgeInsets.all((20 / 375.0) * MediaQuery.of(context).size.width),
    //                           decoration: BoxDecoration(
    //                             color:const Color(0xFF979797).withOpacity(0.1),
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Image.asset(
    //                             demoProducts[0].images[0],
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 5,),
    //                       Text(
    //                         demoProducts[0].title,
    //                         style:const TextStyle(
    //                           color: Colors.black,
    //                         ),
    //                         maxLines: 2,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "\$${demoProducts[0].price}",
    //                             style: TextStyle(
    //                               fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
    //                               fontWeight: FontWeight.w600,
    //                               color: const Color(0xFFFF7643),
    //                             ),
    //                           ),
    //                           Container(
    //                             padding: EdgeInsets.all((8 / 375.0) * MediaQuery.of(context).size.width),
    //                             width: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             height: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             decoration: BoxDecoration(
    //                               color:const Color(0xFF979797).withOpacity(0.1),
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //       ),
    //       //end of the first card
    
    
    //       //start of the second card
    //       Padding(
    //         padding:  EdgeInsets.only(left: (20 / 375.0) * MediaQuery.of(context).size.width),
    //         child: SizedBox(
    //                   width: (140 / 375.0) * MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       AspectRatio(
    //                         aspectRatio: 1.02,
    //                         child: Container(
    //                           padding: EdgeInsets.all((20 / 375.0) * MediaQuery.of(context).size.width),
    //                           decoration: BoxDecoration(
    //                             color:const Color(0xFF979797).withOpacity(0.1),
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Image.asset(
    //                             demoProducts[0].images[0],
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 5,),
    //                       Text(
    //                         demoProducts[0].title,
    //                         style:const TextStyle(
    //                           color: Colors.black,
    //                         ),
    //                         maxLines: 2,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "\$${demoProducts[0].price}",
    //                             style: TextStyle(
    //                               fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
    //                               fontWeight: FontWeight.w600,
    //                               color: const Color(0xFFFF7643),
    //                             ),
    //                           ),
    //                           Container(
    //                             padding: EdgeInsets.all((8 / 375.0) * MediaQuery.of(context).size.width),
    //                             width: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             height: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             decoration: BoxDecoration(
    //                               color:const Color(0xFF979797).withOpacity(0.1),
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //       ),
    //       //end of the second card
    
    
    //       //start of the third card
    //       Padding(
    //         padding:  EdgeInsets.only(left: (20 / 375.0) * MediaQuery.of(context).size.width),
    //         child: SizedBox(
    //                   width: (140 / 375.0) * MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       AspectRatio(
    //                         aspectRatio: 1.02,
    //                         child: Container(
    //                           padding: EdgeInsets.all((20 / 375.0) * MediaQuery.of(context).size.width),
    //                           decoration: BoxDecoration(
    //                             color:const Color(0xFF979797).withOpacity(0.1),
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Image.asset(
    //                             demoProducts[0].images[0],
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 5,),
    //                       Text(
    //                         demoProducts[0].title,
    //                         style:const TextStyle(
    //                           color: Colors.black,
    //                         ),
    //                         maxLines: 2,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "\$${demoProducts[0].price}",
    //                             style: TextStyle(
    //                               fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
    //                               fontWeight: FontWeight.w600,
    //                               color: const Color(0xFFFF7643),
    //                             ),
    //                           ),
    //                           Container(
    //                             padding: EdgeInsets.all((8 / 375.0) * MediaQuery.of(context).size.width),
    //                             width: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             height: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             decoration: BoxDecoration(
    //                               color:const Color(0xFF979797).withOpacity(0.1),
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //       ),
    
    //       //end of the third card
    
    //       //start of the fourth card
    //       Padding(
    //         padding:  EdgeInsets.only(left: (20 / 375.0) * MediaQuery.of(context).size.width),
    //         child: SizedBox(
    //                   width: (140 / 375.0) * MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       AspectRatio(
    //                         aspectRatio: 1.02,
    //                         child: Container(
    //                           padding: EdgeInsets.all((20 / 375.0) * MediaQuery.of(context).size.width),
    //                           decoration: BoxDecoration(
    //                             color:const Color(0xFF979797).withOpacity(0.1),
    //                             borderRadius: BorderRadius.circular(15),
    //                           ),
    //                           child: Image.asset(
    //                             demoProducts[0].images[0],
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 5,),
    //                       Text(
    //                         demoProducts[0].title,
    //                         style:const TextStyle(
    //                           color: Colors.black,
    //                         ),
    //                         maxLines: 2,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "\$${demoProducts[0].price}",
    //                             style: TextStyle(
    //                               fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
    //                               fontWeight: FontWeight.w600,
    //                               color: const Color(0xFFFF7643),
    //                             ),
    //                           ),
    //                           Container(
    //                             padding: EdgeInsets.all((8 / 375.0) * MediaQuery.of(context).size.width),
    //                             width: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             height: (28 / 375.0) * MediaQuery.of(context).size.width,
    //                             decoration: BoxDecoration(
    //                               color:const Color(0xFF979797).withOpacity(0.1),
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //       ),
    //       //end of the fourth card
    //     ],
    //   ),
    // );




