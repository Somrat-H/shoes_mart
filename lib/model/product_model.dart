class ProductModel{
  int ?id;
  String ?image;
  String ?name;
  String ?details;
  double ?price;

  int quantity = 1;


  ProductModel({this.details, this.image, this.name, this.price, this.id});
}

List<ProductModel> productList = [
  ProductModel(
    id: 1,
    details: 'Nike IN, top brand most sell shoes',
    image: 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/2a87e3da-58fd-4cdf-8b11-aee7501a8ac5/revolution-6-next-nature-road-running-shoes-NC0P7k.png',
    name: 'Nike IN',
    price:120,
  ),
   ProductModel(
    id: 2,
    details: 'Air Jordan 1 Hi FlyEase, Men shoes',
    image: 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/e50c3d5a-8634-4960-a964-2d8eb0b5e7ac/air-jordan-1-hi-flyease-mens-shoes-VjGcGX.png',
    name: 'Air Jordan 1 Hi FlyEase',
    price: 150,
  ),
   ProductModel(
    id: 3,
    details: 'Nike Court Vision Low Next Nature, Men shoes',
    image: 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/012c85df-3b66-4fca-96f5-19f3afe7c029/court-vision-low-next-nature-mens-shoes-M967RF.png',
    name: 'Nike Court Vision',
    price: 75,
  ),
   ProductModel(
    id: 4,
    details: 'Nike Court Vision Mid Next Nature, sustainable Materials shoes.',
    image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d73486d2-549d-4ec8-bd52-99dc0b5e647e/court-vision-mid-next-nature-mens-shoes-j5K4rb.png',
    name: 'Nike Court Vision',
    price: 85,
  ),
  ProductModel(
    id: 5,
    details: 'Nike Court Legacy, sustainaable Materials',
    image: 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f0e2da9f-f646-4104-8a87-2760b66720d2/court-legacy-mens-shoes-75ljqX.png',
    name: 'Nike Court Legacy',
    price: 70,
  ),
  ProductModel(
    id: 6,
    details: 'ULTRABOOST LIGHT RUNNING SHOES, Grate catch',
    image: 'https://pyxis.nymag.com/v1/imgs/868/4e1/692bc396a50b3bf8c1b7ee1c41d0e5e4b4.rsquare.w600.jpg',
    name: 'ULTRABOOST LIGHT',
    price: 190,
  ),
  ProductModel(
    id: 7,
    details: 'Daily 3.0 Shoes, best seller shoes this year',
    image: 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/3b05de1c-b694-48b1-9855-f8494f99e0b3/air-force-1-07-lv8-mens-shoes-PZf0LL.png',
    name: 'Daily 3.0 Shoes',
    price: 65,
  ),
  ProductModel(
    id: 8,
    details: 'Addidas Stella McCartney, Court slip-on shoes with 2 colors',
    image: 'https://static.nike.com/a/images/t_default/9cf1f6c1-9c2c-4f26-8d53-bf6bade488fb/air-max-genome-mens-shoes-f4SHr3.png',
    name: 'Addidas Stella McCartney',
    price: 180,
  ),
  ProductModel(
    id: 9,
    details: 'Lite Racer Adapt 5.0 shoes, Mens essentails with 11 colors.',
    image: 'https://5.imimg.com/data5/IOS/Default/2021/6/LB/WF/HS/17552598/product-jpeg-500x500.png',
    name: 'Lite Racer Adapt 5.0',
    price: 70,
  ),
  ProductModel(
    id: 10,
    details: 'Fourm Exhibit Low Shoes, mens orginals with 2 colors, new.',
    image: 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/33daf93e-5b23-445c-a837-f827fc45ed9f/wio-9-mens-road-running-shoes-zLBLt0.png',
    name: 'Fourm Exhibit Low Shoes',
    price: 110,
  ),
  ProductModel(
    id: 11,
    details: 'Nite Joggers shoes, original ivy park with 4 colors.',
    image: 'https://static.nike.com/a/images/t_default/bc376c3e-fb23-4d59-a9ff-e2407eaf1c8d/nikecourt-legacy-suede-shoes-QcMfd3.png',
    name: 'Nite Joggers shoes',
    price: 170,
  ),
  

];