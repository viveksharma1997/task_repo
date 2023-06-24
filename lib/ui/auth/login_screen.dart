import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_project/bloc/login_bloc.dart';
import 'package:task_project/ui/custom_widgets/custom_loaders.dart';
import 'package:task_project/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: userNameController,
                validator: (value){
                  if(value!.trim().isEmpty){
                    return "Enter userName!";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                  hintText: "User Name",
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value){
                    if(value!.trim().isEmpty){
                      return "Enter password!";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Password",
                  ),
                ),
              ),

              // Button login
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state is LoginLoadingState){
                    dialogLoader(context);
                  }
                  if(state is LoginSuccessState){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, dashboardRoute);
                  }
                  if(state is LoginErrorState){
                    Navigator.pop(context);
                    print(state.errorMsg);
                  }
                },
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      BlocProvider.of<LoginBloc>(context).add(LoginRefreshEvent(userNameController.text, passwordController.text));
                    }
                  },
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
