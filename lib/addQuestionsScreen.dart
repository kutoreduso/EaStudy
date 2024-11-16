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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/quizzes');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Circles
          Align(
            alignment: const Alignment(-2.20, 1.35),
            child: Container(
              width: 230,
              height: 230,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1.05, -1.60),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.75, -1.20),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.25, -1.50),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF404A42),
              ),
            ),
          ),

          // Title Section
          Positioned(
            top: 40, // Adjust position as needed
            left: 16,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE8D9CB),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Center(
                child: Text(
                  'Enumeration',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(), // Pushes the content downward
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8D9CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Input Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Question',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: 'Type your question here',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Enumeration Answer Input Field
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Answer',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: 'Type the correct answer',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Answer',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: 'Type the correct answer',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Answer',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: 'Type the correct answer',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Answer',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            hintText: 'Type the correct answer',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            border: const UnderlineInputBorder(),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),

          // Save Button
          Positioned(
            bottom: 20, // Adjust distance from the bottom
            right: 20, // Adjust distance from the right
            child: ElevatedButton(
              onPressed: () {
                // Save logic goes here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved!')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xFFE8D9CB),
                shape: const CircleBorder(), // Makes the button circular
              ),
              child: const Icon(
                Icons.save, // Save icon
                color: Colors.black,
                size: 45, // Adjust icon size
              ),
            ),
          ),
        ],
      ),
    );
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

class TrueOrFalsePage extends StatefulWidget {
  @override
  _TrueFalseQuestionState createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueOrFalsePage> {
  bool isTrueSelected = false;
  bool isFalseSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/quizzes');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Circles
          Align(
            alignment: const Alignment(-2.20, 1.35),
            child: Container(
              width: 230,
              height: 230,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1.05, -1.60),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.75, -1.20),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC0B283),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.25, -1.50),
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF404A42),
              ),
            ),
          ),

          // Title Section
          Positioned(
            top: 40, // Adjust position as needed
            left: 16,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE8D9CB),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Center(
                child: Text(
                  'True or False',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(), // Pushes the content downward
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8D9CB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Question',
                              labelStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                              hintText: 'Type your question here',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: const UnderlineInputBorder(),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 154, 154, 154)),
                              ),
                            ),
                          ),
                        ),
                        // True/False Checkbox Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isTrueSelected,
                                    onChanged: (bool? value) {
                                      if (value == null) return;
                                      if (!mounted) return;
                                      setState(() {
                                        isTrueSelected = value;
                                        isFalseSelected = !value;
                                      });
                                    },
                                  ),
                                  const Text('True'),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isFalseSelected,
                                    onChanged: (bool? value) {
                                      if (value == null) return;
                                      if (!mounted) return;
                                      setState(() {
                                        isFalseSelected = value;
                                        isTrueSelected = !value;
                                      });
                                    },
                                  ),
                                  const Text('False'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                    flex: 2), // Add more spacing below the content if necessary
              ],
            ),
          ),

          // Save Button
          Positioned(
            bottom: 20, // Adjust distance from the bottom
            right: 20, // Adjust distance from the right
            child: ElevatedButton(
              onPressed: () {
                // Save logic goes here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved!')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Color(0xFFE8D9CB),
                shape: const CircleBorder(), // Makes the button circular
              ),
              child: const Icon(
                Icons.save, // Save icon
                color: Colors.black,
                size: 45, // Adjust icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
