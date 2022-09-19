import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _quantitycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  showProductDialogBox(BuildContext context) {
    Widget saveButton = FlatButton(onPressed:(){}, child Text('save'));
    AlertDialog productDetailsBox = AlertDialog(
      title: Text('Add new product'),
      content: Container(
        child: Wrap(
          children: [
            Container(
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _pricecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Product Price'),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _quantitycontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Product Quantity'),
              ),
            ),
          ],
          
        ),
        
      ),
      actions: [
        saveButton,
        
      ],

      

    );
  }
}
