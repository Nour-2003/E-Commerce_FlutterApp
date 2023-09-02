import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_project/screens/CartPage.dart';
import 'package:training_project/screens/NotificationPage.dart';
import 'package:training_project/screens/SearchDisp.dart';


class Search extends StatelessWidget
{
  @override
  Widget build (context)
  {
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 812.0) * MediaQuery.of(context).size.height
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.6, // 60% of our width
            //height: 50,
            decoration: BoxDecoration(
              color:const Color(0xFF979797).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child:  TextField(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchDisp()),
                );
              },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search Product",
                iconColor: Color(0xff4a4e69),
                prefixIcon:const Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: (20 / 375.0) * MediaQuery.of(context).size.width,
                  vertical: (9 / 375.0) * MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage()),
              );
            },
            borderRadius: BorderRadius.circular(50),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all((12 / 375.0) * MediaQuery.of(context).size.width),
                  height: (46 / 375.0) * MediaQuery.of(context).size.width,
                  width: (46 / 375.0) * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:const Color(0xFF979797).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("HomePageImgs/CartIcon.svg",
                  color: Color(0xff4a4e69),
                  ),
                ),

              ],
            ),
          ),



          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(50),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all((12 / 375.0) * MediaQuery.of(context).size.width),
                  height: (46 / 375.0) * MediaQuery.of(context).size.width,
                  width: (46 / 375.0) * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("HomePageImgs/Bell.svg",
                  color: Color(0xff4a4e69)
                  ,
                  ),
                ),
                Positioned(
                  top: -3,
                  right: 0,
                  child: Container(
                    height: (16 / 375.0) * MediaQuery.of(context).size.width,
                    width: (16 / 375.0) * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff22223b),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: (10 / 375.0) * MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    )
    //end of the search section
        ;
  }
}