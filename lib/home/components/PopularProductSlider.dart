import 'package:flutter/material.dart';
import 'package:training_project/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PopularProducts extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // start of the first card
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
                              child: Image.asset(
                                demoProducts[0].images[0],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            demoProducts[0].title,
                            style:const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${demoProducts[0].price}",
                                style: TextStyle(
                                  fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFF7643),
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
          //end of the first card
    
    
          //start of the second card
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
                              child: Image.asset(
                                demoProducts[0].images[0],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            demoProducts[0].title,
                            style:const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${demoProducts[0].price}",
                                style: TextStyle(
                                  fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFF7643),
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
          //end of the second card
    
    
          //start of the third card
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
                              child: Image.asset(
                                demoProducts[0].images[0],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            demoProducts[0].title,
                            style:const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${demoProducts[0].price}",
                                style: TextStyle(
                                  fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFF7643),
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
    
          //end of the third card
    
          //start of the fourth card
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
                              child: Image.asset(
                                demoProducts[0].images[0],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            demoProducts[0].title,
                            style:const TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${demoProducts[0].price}",
                                style: TextStyle(
                                  fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFF7643),
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
          //end of the fourth card
        ],
      ),
    );
  }
}