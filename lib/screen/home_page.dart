import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoes_mart/controller/cart_controller.dart';
import 'package:shoes_mart/model/product_model.dart';
import 'package:shoes_mart/screen/cart_page.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartController cartController = Get.put(CartController());
  
   int cureentIndex=0;
   List<String> urlImg = [
    'images/img5.jpg',
    'images/img6.jpg'
   ];
  Widget buildImg(String urlImg, int index) => Container(
    
   margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      
      image: DecorationImage(
        
        image: AssetImage('${urlImg}', ),
        fit: BoxFit.fill,
       
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartPage()));
        },
        child: Container(
          height: 60,
          color: const Color.fromARGB(255, 225, 63, 14),
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                GetBuilder<CartController>(builder: (e){
                  return Text("${cartController.cartList.length}   " + "    "+'Added', style: const TextStyle(
                  color: Colors.white
                ),);
                })
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          // ignore: sort_child_properties_last
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Icon(Icons.menu,size: 30,),
                Text('Shoes Mart',style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 247, 106, 30),
                  fontWeight: FontWeight.w700
                ),),
                Icon(Icons.search_outlined,size: 30,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                   Text('New Arrival', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                   Text('See All'),
                ],
              ),
            ),
           
           Column(
             children: [
               CarouselSlider.builder(
                 itemCount: urlImg.length, 
                 itemBuilder: (context, index, realindex){
                   String urlImgs = urlImg[index];
                   return buildImg( urlImgs, index);
                 } ,
                 options: CarouselOptions(
                   height: 150,
                   autoPlay: true,
                   enlargeCenterPage: true,
                   reverse: true,
                   autoPlayInterval: Duration(seconds: 1),
                  onPageChanged: (index, reason){
                    setState(() {
                      cureentIndex = index;
                    });
                  },
                 )),
                //  SizedBox(
                //   height: 5,
                //  ),
                 CarouselIndicator(
          count: urlImg.length,
          index: cureentIndex,
          activeColor: Colors.black, 
          color: Colors.white,
        ),
             ],
           ),
           
              SizedBox(
                  height: 10,
                 ),
            
            Expanded(
              flex: 3,
              child: GridView.builder(

                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5), 
                  itemBuilder: (context, index){
                    return Container(
                       decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [Image.network('${productList[index].image}', 
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: 150,
                                top: 2,
                                right: 10,
                                child:  IconButton(onPressed: (){
                                   try{
                                    cartController.cartList.firstWhere((element) => element.id==productList[index].id);
                                    var snackBar = const SnackBar(content: Text('Already Added this item'),);
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                  }
                                      catch(e){
                                        cartController.addToCart(productList[index]);
                                        cartController.getTotal();

                                      }
                                }, icon: const Icon(Icons.shopping_cart_outlined)),)
                              ],
                            
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Men's Shoes", style: TextStyle(
                                color: Color.fromARGB(255, 248, 111, 52),
                                fontSize: 10
                              ),),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('${productList[index].name}',
                               
                               style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                
                                
                              ),),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('\$${productList[index].price}', style: const TextStyle(
                                fontWeight: FontWeight.w700
                              ),)),
                          ],
                        ),
                      ),
                     
                    );
                  })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                Text('Popular', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text('See All'),
              ],),
            ),
            //  Expanded(
            //   flex: 2,
            //   child: ListView.separated(
            //     shrinkWrap: true,
                
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index){
            //       return Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
                     
            //         ),
            //         width: 250,
            //         child: Padding(
            //           padding: const EdgeInsets.all(1.0),
            //           child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   Stack(
            //                     children:[ Image.network('${productList[index].image}', 
            //                       height: MediaQuery.of(context).size.height * 0.2,
            //                       width: double.infinity,
            //                       fit: BoxFit.cover,
            //                     ),
            //                      Positioned(
            //                     left: 200,
            //                     top: 2,
            //                     right: 10,
            //                     child:  IconButton(onPressed: (){
            //                         try{
            //                         cartController.cartList.firstWhere((element) => element.id==productList[index].id);
            //                         var snackBar = const SnackBar(content: Text('Already Added this item'),);
            //                         ScaffoldMessenger.of(context).showSnackBar(snackBar);

            //                       }
            //                           catch(e){
            //                             cartController.addToCart(productList[index]);
                                        
            //                           }
            //                     }, icon: const Icon(Icons.shopping_cart_outlined)),)
            //                     ]
            //                   ),
            //                   const Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Text("Men's Shoes", style: TextStyle(
            //                       color: Color.fromARGB(255, 248, 111, 52),
            //                       fontSize: 10
            //                     ),),
            //                   ),
            //                   Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Text('${productList[index].name}',
                               
            //                      style: const TextStyle(
            //                       fontWeight: FontWeight.w700,
                                  
                                  
            //                     ),),
            //                   ),
            //                   const SizedBox(
            //                     height: 5,
            //                   ),
            //                   Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Text('\$${productList[index].price}', style: const TextStyle(
            //                       fontWeight: FontWeight.w700
            //                     ),)),
            //                 ],
            //               ),
            //         ),
                    
            //       );
            //     }, 
            //     separatorBuilder: (context, int){
            //       return const SizedBox(width: 10);
            //     }, itemCount: productList.length)),
          ],
        ),
      )),
    );

  }
}