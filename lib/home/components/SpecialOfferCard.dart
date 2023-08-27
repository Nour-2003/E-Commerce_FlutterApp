import 'package:flutter/material.dart';


class SpecialOffer extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //first card
                  Padding(
                    padding:  EdgeInsets.only(
                      left: (20 / 375.0) * MediaQuery.of(context).size.width,
                    ),
                    child: SizedBox(
                      width: (242 / 375.0) * MediaQuery.of(context).size.width,
                      height: (100 / 375.0) * MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "HomePageImgs/ImageBanner-2.png",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff343434).withOpacity(0.4),
                                    Color(0xff343434).withOpacity(0.15),
                                    ],
                                  ),
                              ),
                            ),
                             Padding(
                               padding: EdgeInsets.symmetric(
                                horizontal:  (15 / 375.0) * MediaQuery.of(context).size.width,
                                vertical:  (10 / 375.0) * MediaQuery.of(context).size.width,
                                ),
                               child: Text.rich(
                                TextSpan(
                                  style:const TextStyle(
                                    color: Colors.white,
                             
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Smart Phone\n",
                                      style: TextStyle(
                                        fontSize:  (18 / 375.0) * MediaQuery.of(context).size.width,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "18 Brands" 
                                    ),
                                  ],
                                ),
                                                 ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
            
                //end of the first card
            
            
                  //second card
                  Padding(
                    padding:  EdgeInsets.only(
                      left: (20 / 375.0) * MediaQuery.of(context).size.width,
                    ),
                    child: SizedBox(
                      width: (242 / 375.0) * MediaQuery.of(context).size.width,
                      height: (100 / 375.0) * MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "HomePageImgs/ImageBanner-3.png",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff343434).withOpacity(0.4),
                                    Color(0xff343434).withOpacity(0.15),
                                    ],
                                  ),
                              ),
                            ),
                             Padding(
                               padding: EdgeInsets.symmetric(
                                horizontal:  (15 / 375.0) * MediaQuery.of(context).size.width,
                                vertical:  (10 / 375.0) * MediaQuery.of(context).size.width,
                                ),
                               child: Text.rich(
                                TextSpan(
                                  style:const TextStyle(
                                    color: Colors.white,
                             
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Fashion\n",
                                      style: TextStyle(
                                        fontSize:  (18 / 375.0) * MediaQuery.of(context).size.width,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "24 Brands" 
                                    ),
                                  ],
                                ),
                                                 ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
            
                //end of the second card

                SizedBox(
                  width: (20 / 375.0) * MediaQuery.of(context).size.width,
                ),
            
                ],
              ),
            );
  }
}