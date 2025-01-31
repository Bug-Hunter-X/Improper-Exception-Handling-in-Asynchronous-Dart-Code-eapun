# Improper Exception Handling in Asynchronous Dart

This repository demonstrates a common error in asynchronous Dart code: insufficient exception handling in `async` functions.

The `bug.dart` file shows code that uses a `try-catch` block, but only prints errors to the console and then rethrows. This is insufficient for production applications.

The `bugSolution.dart` file provides an improved version with more robust exception handling, including more specific error handling and more informative error messages.