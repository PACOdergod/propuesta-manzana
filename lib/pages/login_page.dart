import 'package:flutter/material.dart';
import 'package:login_manzana/widgets/animated_background.dart';
import 'package:login_manzana/widgets/my_icon_boton.dart';
import 'package:login_manzana/widgets/principal_boton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [

              AnimatedBackground(),

              _Body(),

            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [

          SafeArea( child: SizedBox(height: 10),),
      
          _Formulario(),
      
          Spacer(),

          _LoginBotones(),

          Spacer(),

          _Registrar(),

          SizedBox(height: 15),

        ],
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Column(children: [

        Text('Inicia sesión', style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),

        SizedBox(height: 12),
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              labelText: "Usuario o correo",
              labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
    
        SizedBox(height: 12),
    
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              labelText: "Contraseña",
              hintText: '******',
              labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
              contentPadding: EdgeInsets.all(0),
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined, 
                size: 40,
                color: Colors.yellow.shade800,
              ),
            ),
          ),
        ),
    
        SizedBox(height: 12),
    
        PrincipalBoton(
          text: 'Iniciar sesion',
          textColor: Colors.black,
          backColor: Colors.yellow.shade700,
        ),

        SizedBox(height: 10,),
        Text('Olvidé mi contraseña', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          decoration: TextDecoration.underline
        ),),

      ],),
    );
  }
}

class _LoginBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text('O tambien', style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            faceBoton(
              ancho: (MediaQuery.of(context).size.width/2)-50
            ),
            googleBoton(
              ancho: (MediaQuery.of(context).size.width/2)-50
            )
          ],
        ),

        SizedBox(height: 20),

        PrincipalBoton( text: 'Continúa con tu celular'),

      ],
    );
  }
}

class _Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-40,
      child: Column(
        children: [
          Text('¿Aún no tienes una cuenta?', style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold,
            color: Colors.black87
          ),),
          SizedBox(height: 10),
          PrincipalBoton(
            text: '¿Que esperas?!!', 
            autoajustar: true,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            borderRadius: BorderRadius.circular(30),
          ),
        ],
      ),
    );
  }
}