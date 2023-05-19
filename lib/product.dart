
class Product{
  String productno;
  String name;
  String site;
  String link;
  Product(this.productno,this.name,this.site,this.link);


  @override
  String toString() {
    return 'Product{product: $productno,name:$name,site:$site,link:$link}';
  }
}
