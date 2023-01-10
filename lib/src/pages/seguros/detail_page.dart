
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/seguros/data_seguros.dart';
import 'package:seguro_motors_final/src/utils/constant.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key,required this.planetInfo}) : super(key: key);
  final CarInfo planetInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          SizedBox(height: 220),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 23,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w900
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 23,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(color: Colors.black38,),
                          SizedBox(height: 32.0),
                          Text(
                            planetInfo.description??'',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 23,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 32.0),
                          Divider(color: Colors.black38,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 23,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 250.0,
                      padding:const EdgeInsets.only(left: 32.0) ,
                      child: ListView.builder(
                        itemCount: planetInfo.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index){
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                      planetInfo.images[index],
                                    fit: BoxFit.cover,

                                  )
                              ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Positioned(
                  right: -70,
                  child:Hero(
                      tag: planetInfo.position,
                      child: Image.asset(
                          planetInfo.iconImage,
                        width: 370,
                        height: 350,
                      )
                  )
              ),
              Positioned(
                top: 60,
                  left: 32,
                  child: Text(
                    planetInfo.position.toString(),
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 23,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900
                    ),
                    textAlign: TextAlign.left,
                  ),
              ),
              IconButton(
                onPressed: (){Navigator.pop(context);},
                  icon:Icon(Icons.arrow_back_ios)
              )
            ],
          )
      ),
    );
  }
}
