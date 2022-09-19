
class Product {
  int id;
  String name;
  String price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

      //From map........Map=> Product object
      static Product fromMap(Map<String, dynamic>)
      {
          Product product = Product();
          product.id = query['id'];
          product.name = query['name'];
          product.price = query['price'];
          product.quantity = query['quantity'];

          return product;
      }

      //to Map ------ Product =>Map
      static Map<String, dynamic>{
        return <String, dynamic>{
          'id': product.id,
          'name' : product.name,
          'quantity': product.quantity,

        };
      }

      // From map list ------map list => product list
      static List<Product> fromMapList(List<Map<String, dynamic>> query){
        List<Product> product = List<Product>();
        for(Map mp in query){

          product.add(fromMap(mp));
        }

        return products;
      }
      
}
