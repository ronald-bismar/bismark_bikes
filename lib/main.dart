import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_tutorial/firebase_options.dart';
import 'package:login_tutorial/presentation/screens/presentation_app.dart';
import 'package:login_tutorial/presentation/widgets/button_gradient.dart';
import 'package:login_tutorial/presentation/widgets/subtitle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF292A2B).withAlpha(200),
          Color(0xFF292A2B),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 340),
                Column(
                  children: [
                    buttonGradient("INGRESAR", () {
                      showModal(context);
                    }, [Color(0xFFFFB300), Color.fromARGB(255, 235, 142, 3)]),
                    SizedBox(height: 60),
                    buttonGradient("REGISTRO", () {
                      showModalSignUp(context);
                    }, [Color(0xFFFFB300), Color.fromARGB(255, 235, 142, 3)]),
                  ],
                ),
                Text(
                  "O",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5),
                ),
                buttonGoogle()
              ],
            )),
      ),
    );
  }

  SizedBox buttonGoogle() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 212, 212, 212),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_google.png', height: 25),
            SizedBox(width: 10),
            Text(
              "Continuar con Google",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    bool obscurePassword = true;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 32,
                    left: 32,
                    right: 32,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Subtitle(text: "INGRESAR"),
                    SizedBox(height: 40),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                          hintText: "Correo electronico",
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      obscureText: obscurePassword,
                      controller: controllerPassword,
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 40),
                    buttonGradient("INGRESAR", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PresentationApp()));
                    }, [Color(0xFFFFB300), Color.fromARGB(255, 235, 142, 3)]),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Olvido su contraseña?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        )),
                    SizedBox(height: 20),
                    buttonGoogle(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            );
          });
        });
  }

  void showModalSignUp(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    bool obscurePassword = true;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 32,
                    left: 32,
                    right: 32,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTRO",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                          hintText: "Nombre",
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                          hintText: "Correo electronico",
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: obscurePassword,
                      controller: controllerPassword,
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 20),
                    buttonGradient("REGISTRO", () {},
                        [Color(0xFFFFB300), Color.fromARGB(255, 235, 142, 3)]),
                    SizedBox(height: 40),
                    buttonGoogle(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            );
          });
        });
  }
}
