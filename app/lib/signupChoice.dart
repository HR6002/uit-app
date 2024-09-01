import 'package:flutter/material.dart';
import 'login.dart';
import 'signup-business.dart';
import 'signup-employee.dart';

class SignupChoice extends StatelessWidget {
  const SignupChoice({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: const Text('Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                        const Text(
              'Please choose your role:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 35),
            
            GestureDetector(
              onTap: () {
                                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusinessSignup()),
                    );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.purple,
                    width: 1.0,
                  ),
                ),
                height: 38,
                width: 290,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'I am a business',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap:(){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EmployeeSignup()),
                    );} ,
            child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:Colors.deepPurple,
                  width: 1.0,
                ),
              ),
              height: 38,
              width: 290,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'I am an eployee',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
