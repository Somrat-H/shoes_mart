import 'package:get/get.dart';
import 'package:shoes_mart/model/product_model.dart';
class CartController extends GetxController{
  List<ProductModel> cartList = [];

  addToCart(ProductModel productModel){
    cartList.add(productModel);
    update();
  }
  removeFromCart(int index){
    cartList.removeAt(index);
    update();
  }
  decrement(int index){
     cartList[index].quantity>0?  cartList[index].quantity-- : null;
     getTotal();
     update();
  }
  increment(int index){
    cartList[index].quantity++;
    getTotal();
    update();
  }

  @override
 
   var netTotal ;

  void getTotal(){
  netTotal = cartList.map((item) => item.price!.toInt() * item.quantity )
      .reduce((value, element) => value+element);
      update();
  }

   void onInit() {
      cartList.isNotEmpty?  getTotal() :null;
      update();
    // TODO: implement onInit
    super.onInit();
  }
}