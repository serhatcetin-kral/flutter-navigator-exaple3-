import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.grey),
        //home: HomePage(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          RoutePink.routeName: (context) => RoutePink(),
          RouteGreen.routeName: (context) => RouteGreen(),
          RouteGrey.routeName: (context) => RouteGrey(),
        },
      onGenerateRoute: (settings){
        // if(settings==HomePage.routeName){
        //   return MaterialPageRoute(builder: (context)=>HomePage());}
        //   if(settings==RoutePink.routeName){
        //     return MaterialPageRoute(builder: (context)=>RoutePink());}
        //   if(settings==RouteGreen.routeName){
        //     return MaterialPageRoute(builder: (context)=>RouteGreen());}
        //   if(settings==RouteGrey.routeName){
        //     return MaterialPageRoute(builder: (context)=>RouteGrey());}
        //   return null;

           switch(settings.name){
             case HomePage.routeName:
                 return  MaterialPageRoute(builder: (context)=>HomePage());
             case RoutePink.routeName:
               return  MaterialPageRoute(builder: (context)=>RoutePink(settings.arguments));//burada hata var
             case RouteGreen.routeName:
               return MaterialPageRoute(builder: (context)=>RouteGreen());
            case RouteGrey.routeName:
             return MaterialPageRoute(builder: (context)=>RouteGrey());
             default :
               null;

           }
        }

        );
  }
}

class Kullanici {
  String ad;
  int yas;
  String adres;

  Kullanici({required this.ad, required this.yas, required this.adres});
 // Users({required this.name,required this.age,required this.address});
}

class HomePage extends StatelessWidget {
  final Kullanici kullanici_1 =
  Kullanici(ad: 'Metin', adres: 'Beşiktaş', yas: 40);

  static  const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            RaisedButton(
                child: Text('Git -> Route Pink'),
                onPressed: () {
                  Navigator.pushNamed(context, RoutePink.routeName,
                      arguments: kullanici_1);
                })
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static const String routeName = '/routePink';

  final  Kullanici yerelKullanici;
   RoutePink(this.yerelKullanici);
  @override
  Widget build(BuildContext context) {
   // Kullanici yerelKullanici = ModalRoute.of(context)!.settings.arguments as Kullanici;


    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Text('kullanıcı adı : ${yerelKullanici.ad}, yaşı:${yerelKullanici.yas}, adres:${yerelKullanici.adres}'),

            Text('route pin kacildi'),
            RaisedButton(
                child: Text('Git -> Route Green'),
                onPressed: () {
                  Navigator.pushNamed(context, RouteGreen.routeName);
                }),
            RaisedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static const String routeName = '/routeGreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGreen en üstte'),
            RaisedButton(
                child: Text('Git -> Route Grey'),
                onPressed: () {
                  Navigator.pushNamed(context, RouteGrey.routeName);
                }),
            RaisedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static const String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Şu an RouteGrey en üstte'),
            RaisedButton(child: Text('Git -> ....'), onPressed: () {}),
            RaisedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}