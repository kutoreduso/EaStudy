import 'package:flutter/material.dart';

// Add your pages here (for example: IdentificationPage, EnumerationPage, etc.)
class AddQuestionsScreen extends StatelessWidget {
  final String quizName;

  AddQuestionsScreen({required this.quizName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/quizzes');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        title: Text(
          quizName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment(-2.20, 1.35),
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-1.05, -1.60),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        Align(
          alignment: Alignment(1.75, -1.20),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        Align(
          alignment: Alignment(1.25, -1.50),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF404A42),
            ),
          ),
        ),
        Text(
          'There are no questions\nTap the "+" button to add question',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xFFE8D9CB),
                title: Text(
                  'Choose Question Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildChoiceOption(
                        context, 'Identification', IdentificationPage()),
                    _buildChoiceOption(
                        context, 'Enumeration', EnumerationPage()),
                    _buildChoiceOption(
                        context, 'Multiple Choice', MultipleChoice()),
                    _buildChoiceOption(
                        context, 'True or False', TrueOrFalsePage()),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // This method builds the dialog options and handles navigation
  Widget _buildChoiceOption(
      BuildContext context, String title, Widget destinationPage) {
    return ListTile(
      leading: Icon(Icons.check_circle_outline),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the dialog
        // Navigate to the selected page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }
}

// Example destination pages
class IdentificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Identification')),
      body: Center(child: Text('Welcome to the Identification Page')),
    );
  }
}

class EnumerationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Enumeration')),
        body: Scaffold(
            body: SafeArea(
                child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD7C7A5), Color(0xFFA09785)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Overlapping circle patterns
            Positioned(
              top: -100,
              left: -80,
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Color(0xFFA09785),
              ),
            ),
            Positioned(
              top: 50,
              right: -80,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Color(0xFF6C6959),
              ),
            ),
            Positioned(
              bottom: -120,
              left: -60,
              child: CircleAvatar(
                radius: 180,
                backgroundColor: Color(0xFF6C6959),
              ),
            ),
            Positioned(
              bottom: 100,
              right: -100,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Color(0xFFA09785),
              ),
            ),
            // Main content with question and answers
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black),
                      Icon(Icons.menu, color: Colors.black),
                    ],
                  ),
                ),
                // Title
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90.0, vertical: 8.0),
                    child: Text(
                      'MULTIPLE CHOICE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // Question and Answer List
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Question Input Field
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE8D9CB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            border: InputBorder.none,
                            hintText: "Enter your question here",
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      // Answer Input Fields
                      for (int i = 1; i <= 4; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE8D9CB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                border: InputBorder.none,
                                hintText: "Answer $i",
                                hintStyle: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      Spacer(),
                      // Save Icon Button at Bottom Right
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.save_alt,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ))));
  }
}

// Helper function for answer options with divider

class MultipleChoice extends StatefulWidget {
  @override
  _MultipleChoiceState createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _answerControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  void _saveData() {
    String question = _questionController.text;
    List<String> answers =
        _answerControllers.map((controller) => controller.text).toList();

    // Example action: Print the inputs
    print("Question: $question");
    print("Answers: $answers");

    // Optional: Show a confirmation Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Question and answers saved successfully!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Circle Designs in Background
          Align(
            alignment: Alignment(-2.0, 1.5),
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1.2, -1.5),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: Alignment(1.7, -1.1),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: Alignment(1.25, -1.5),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF404A42),
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title with BoxDecoration
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE8D9CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      'MULTIPLE CHOICE',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                // Question Input Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE8D9CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your question here",
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                // Answers Box Decoration
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE8D9CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: _answerControllers[i],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    "Answer ${i + 1}", // Dynamic hint text
                                hintStyle: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Spacer(),
                // Save Icon Button at Bottom Right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      icon: Icon(Icons.save_alt, color: Colors.black, size: 30),
                      onPressed: _saveData, // Call the save function
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}

class TrueOrFalsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(alignment: Alignment.center, children: [
        // First circle
        Align(
          alignment: Alignment(-2.20, 1.35), // Adjusted alignment
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        // Second circle
        Align(
          alignment: Alignment(-1.05, -1.60), // Adjusted alignment
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        // Third circle
        Align(
          alignment: Alignment(1.75, -1.20), // Adjusted alignment
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC0B283),
            ),
          ),
        ),
        // Fourth circle with a darker color
        Align(
          alignment: Alignment(1.25, -1.50), // Adjusted alignment
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF404A42),
            ),
          ),
        ),
        // Content inside Padding
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container Box for content
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFE8D9CB),
                  borderRadius: BorderRadius.circular(20),
                ),
                // Text content
                child: Center(
                  child: Text(
                    'True or False',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 55),

        // Positioned widget for moving the bottom content lower
        Positioned(
            top:
                80, // This controls how far from the bottom the content will be
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
              child:
                  // Container Box for content
                  Container(
                width: 50, // Adjust the width to your preference
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFE8D9CB),
                  borderRadius: BorderRadius.circular(20),
                ),
                // Text content
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        // Ensures the TextField takes up available space
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align to the top-left
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  16.0), // Optional padding for spacing
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText:
                                      'Question', // Add a label for the question field
                                  labelStyle: TextStyle(
                                    color: Colors
                                        .grey, // Customize the label text style
                                    fontSize: 16,
                                  ),
                                  hintText:
                                      'Type your question here', // Add a hint for the field
                                  hintStyle: TextStyle(
                                    color:
                                        Colors.grey.shade400, // Hint text color
                                  ),
                                  border:
                                      UnderlineInputBorder(), // Default underlined border
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .blue, // Underline color when focused
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .grey, // Underline color when not focused
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddQuestionsScreen(quizName: "Sample Quiz"), // Pass quiz name here
  ));
}
