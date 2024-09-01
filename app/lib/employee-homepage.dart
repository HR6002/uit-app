import 'package:flutter/material.dart';



class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  int _selectedIndex = 1; // Start with Home Page as the default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          NewJobsPage(),
          HomePage(),
          PreviousJobsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'New Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Previous Jobs',
          ),
        ],
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
      ),
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
    return  SingleChildScrollView( 
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 85),
      
      // Wrap the Column in a SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: (){
                showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: 500,
          height: 500,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
 Text(
                  'More Info:',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
  
              SizedBox(height: 20.0),
              Text("You Must Have a Driving Liscence for this Job!"),
              SizedBox(height: 30,),
              Center(
              child: ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("CANCEL JOB", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: Colors.red),)))
            ],
          ),
        );
      },
    );
              },




            child:Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Bubble Bliss", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                      SizedBox(width: 86,),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child:
                      Text("Status: Active", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.green),))
                    ],),

                    Text("Position: Waiter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.calendar_month, size: 18,),
                      SizedBox(width: 2,),
                      Text("01/09/2024 - 12/09/2024", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.timelapse, size: 18,),
                      SizedBox(width: 2,),
                      Text("09:00 - 17:00", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,), 
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.location_pin, size: 18,),
                      SizedBox(width: 2,),
                      Text("12 Regent Avenue, E11 3SF", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.person, size: 18,),
                      SizedBox(width: 2,),
                      Text("Muhammed Rahman - 07654289765", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                  ],
                ),
              ),
              height: 160,
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255), // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                border: Border.all(
                  color: Colors.green, // Border color
                  width: 2, // Border width
                ),
              ),
            ),),
            
            SizedBox(height: 20,),
       




          ],
        ),
      );
  }
}



class NewJobsPage extends StatefulWidget {
  const NewJobsPage({super.key});

  @override
  State<NewJobsPage> createState() => _NewJobsPage();
}









class _NewJobsPage extends State<NewJobsPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView( 
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 85),
      
      // Wrap the Column in a SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: (){
                showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: 500,
          height: 500,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
 Text(
                  'More Info:',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
  
              SizedBox(height: 20.0),
              Text("You Must Have a Driving Liscence for this Job!"),
              SizedBox(height: 30,),
              Center(
              child: ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("APPLY FOR JOB", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: Colors.green),)))
            ],
          ),
        );
      },
    );
              },




            child:Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Bubble Bliss", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                      SizedBox(width: 86,),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child:
                      Text("Status: Open", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.deepPurple),))
                    ],),

                    Text("Position: Waiter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.calendar_month, size: 18,),
                      SizedBox(width: 2,),
                      Text("01/09/2024 - 12/09/2024", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.timelapse, size: 18,),
                      SizedBox(width: 2,),
                      Text("09:00 - 17:00", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,), 
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.location_pin, size: 18,),
                      SizedBox(width: 2,),
                      Text("12 Regent Avenue, E11 3SF", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.person, size: 18,),
                      SizedBox(width: 2,),
                      Text("Muhammed Rahman - 07654289765", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                  ],
                ),
              ),
              height: 160,
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255), // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                border: Border.all(
                  color: Colors.deepPurple, // Border color
                  width: 2, // Border width
                ),
              ),
            ),),
            
            SizedBox(height: 20,),
       




          ],
        ),
      );
  }
}









class PreviousJobsPage extends StatefulWidget {
  const PreviousJobsPage({super.key});

  @override
  State<PreviousJobsPage> createState() => _PreviousJobsPage();
}









class _PreviousJobsPage extends State<PreviousJobsPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView( 
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 85),
      
      // Wrap the Column in a SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: (){
                showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: 500,
          height: 500,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
 Text(
                  'More Info:',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
  
              SizedBox(height: 20.0),
              Text("Total Compensation: £12,000 -Payed"),
              SizedBox(height: 30,),
              
            ],
          ),
        );
      },
    );
              },




            child:Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Bubble Bliss", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                      SizedBox(width: 86,),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child:
                      Text("Status: Done", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey),))
                    ],),

                    Text("Position: Waiter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.calendar_month, size: 18,),
                      SizedBox(width: 2,),
                      Text("01/09/2024 - 12/09/2024", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.timelapse, size: 18,),
                      SizedBox(width: 2,),
                      Text("09:00 - 17:00", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,), 
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.location_pin, size: 18,),
                      SizedBox(width: 2,),
                      Text("12 Regent Avenue, E11 3SF", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                    SizedBox(height: 3,),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(Icons.person, size: 18,),
                      SizedBox(width: 2,),
                      Text("Muhammed Rahman - 07654289765", style: TextStyle(fontWeight: FontWeight.w300),)
                    ],),
                  ],
                ),
              ),
              height: 160,
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255), // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2, // Border width
                ),
              ),
            ),),
            
            SizedBox(height: 20,),
       




          ],
        ),
      );
  }
}


