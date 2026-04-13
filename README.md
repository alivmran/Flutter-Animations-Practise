# Classwork # 5 - Flutter Animations (Explicit & Implicit)

## Group Details
* **Group Number:** 5
* **Members:**
  * Syed Ali Imran - 2380254
  * Sibtain Ahmed - 2380252
  * Rafay Abbasi - 2380220
  * Mehmood Rashid - 2380237

## Project Overview
This repository contains a single-page Flutter application demonstrating both Explicit and Implicit animations, fulfilling the requirements for the "Fade in Logo" assignment.

### Structure
The app is built using two distinct widgets within a single layout:

1. **Explicit Animation (`ExplicitAnimationWidget`):**
   * Uses an `AnimationController` paired with a `Tween` and a `FadeTransition` widget.
   * Gives us fine-grained control over the lifecycle of the animation (start, stop, reverse). It requires a `StatefulWidget` and `SingleTickerProviderStateMixin`.
   
2. **Implicit Animation (`ImplicitAnimationWidget`):**
   * Uses `AnimatedContainer` and `AnimatedOpacity`.
   * Flutter automatically handles the interpolation between the old state values and the new state values when `setState` is called. It requires less boilerplate code compared to explicit animations.

## Screenshots / Video
<img width="624" height="312" alt="image" src="https://github.com/user-attachments/assets/e1204cc4-3d70-4ce9-aefe-90f4f759e218" />
