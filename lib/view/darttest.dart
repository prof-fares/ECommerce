// class Car {
//   String name;
//   String price;
//   Car(this.name,this.price); 
// } 

abstract class ProtoType{
 ProtoType clone();
}
class Car extends ProtoType{
 String? name;
String price;
  Car(this.price); 
  void setName(myname){
    name =myname;
  }
  @override
  Car clone() {
       return Car(price);
  }

}
void main(){
   Car car1=Car("100\$");
   car1.setName("kia");
   Car car2=car1.clone();
   car2.price="200\$";
   print(car1==car2);
   print(car1.name);
   print(car2.name);
   print(car1.price);
   print(car2.price);
   
}

