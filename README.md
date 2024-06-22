# TALKIE FORM - A Flutter TTS App

Talkie Form is an innovative Flutter application designed to collect user inputs and convert them into spoken text using native text-to-speech (TTS) capabilities on Android devices. This project demonstrates proficiency in Flutter, Dart, and Kotlin, showcasing the ability to bridge between Flutter and native code for enhanced functionality.

## Features

**Beautiful UI**: A clean and user-friendly interface designed with Flutter.

**User Input Collection**: Form to collect user's name, address, city, state, and country.

**Native Integration**: Utilizes Android's native TTS engine via Kotlin for high-quality speech synthesis.

**Cross-Platform Potential**: Foundation laid for iOS implementation with Swift/Objective-C.

## Project Structure

### Flutter-Dart Code
**UI Implementation**: The main user interface is implemented in lib/main.dart, featuring a form for user input.

**Native Communication**: Uses MethodChannel to communicate between Flutter and native Android code.

### Android Native Code (Kotlin)
**Text-to-Speech**: The TTS functionality is implemented in MainActivity.kt, demonstrating integration with Android's native TTS engine.

**Lifecycle Management**: Proper lifecycle management to initialize and shutdown TTS.
