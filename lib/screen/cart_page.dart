import 'package:flutter/material.dart';
import 'package:shoes_mart/controller/cart_controller.dart';
import 'package:shoes_mart/screen/home_page.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.put(CartController());
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.arrow_back_ios_new)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Cart Page',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromARGB(255, 255, 107, 16),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder<CartController>(
                  builder: (e) => cartController.cartList.length == 0
                      ? Center(child: Text('Nothing Your Cart'))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartController.cartList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${cartController.cartList[index].name}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Review (4.9 ⭐️)',
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "\$ ${cartController.cartList[index].price! * cartController.cartList[index].quantity}",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 255, 107, 16),
                                                  borderRadius: BorderRadius.circular(15)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .decrement(index);
                                                        },
                                                        icon: const Icon(
                                                            Icons.remove)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        '${cartController.cartList[index].quantity}'),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          cartController
                                                              .increment(index);
                                                        },
                                                        icon:
                                                            const Icon(Icons.add)),
                                                  ],
                                                ),
                                              ),
                                              IconButton(onPressed: (){
                                                cartController.removeFromCart(index);
                                                cartController.getTotal();

                                              }, icon: Icon(Icons.delete))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Image.network(
                                      '${cartController.cartList[index].image}',
                                      height: 150,
                                      width: 150,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ),
              Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white),
                  child: Center(
                    child: GetBuilder<CartController>(
                        builder: (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 50
                              ),
                              child: GetBuilder<CartController>(builder: (context){
                                return Column(
                                children: [
                                  Text(
                                        "Total price",
                                        style: const TextStyle(
                                          color: Colors.black54,
                                            fontSize: 18, fontWeight: FontWeight.w400),
                                      ),
                                        Text(
                                        "${cartController.netTotal ?? 0}\$",
                                        style: const TextStyle(
                                        
                                          fontSize: 20, fontWeight: FontWeight.w700),
                                      )
                                ],
                              );
                              },)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 107, 16),
                            
                                ),
                                child: Center(child: Text('Proceed', style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                                ),)),
                              ),
                            )
                          ],
                        )),
                  ))
            ],
          )),
    );
  }
}
