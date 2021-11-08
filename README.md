# meal_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


- we have two widgets at start a statefull and stateless widget
- we write most of our logic before the @override 
- any widget which uses SCAFFOLD is a screen or page
- connecting pages: MAIN.DART => TAKE DATA => go to file where DATA is used
- in bigger apps its better to use pushnamed routes that push routes
- write the steps on page before building the app, this will require me to do lot of paper work before coding
- once used TABBAR => dont need to use scaffold since it is already used in tab bar and no need to have it again
- adding tabs at top works with stateless widget, but adding tabs at bottom needs stateful widget
- bottom nav bar requires to control which tab to select manually, flutter gives index automatically to the tab 
- see documentation for styling
- we can also go with shifting but i didnt like it
- creating a separate widget VS storing widget as function: when we have something in the content of the widget which triggers the build method then its a good opt to store it as a new separate widget and calling that widget over there.
- delete the pages in stack to avoid slowing down of app: make pages, connect pages, delete pages
- on simply pressing back button, we pass NULL value to .then()
- remove item isnt working fine

- GESTUREDETECTOR: used to execute functions when user taps or double tap... => wrap the container widget inside this, container will have area where we need to tap
- INKWELL: a gesture detector which gets executed on tap and creates the ripple effect on tap
- NAVIGATOR: a class in flutter which helps in navigating, it takes context, hence we need to pass context into the function/method
- ROUTES: it takes a list of key value pairs which help in navigating to different screens, this is highly effective way for bigger apps
- CLIPRRECT: it takes a widget and clip it to given shape, such as rounded rectangle
- BOXFIT.COVER: resizes the image without disturbing the ratio and make it fit inside the given size container
- ONGENERATEROUTE: this is another way to assign routes to the app when we have highly dynamic route and we want to show some page when an unknown route is requested. generally in such cases we return to home page or show error page. 
- ONUNKNOWNROUTE: similar to 404 page error.
- SINGLECHILDSCROLLVIEW: helps to make column scrollable
- PUSHREPLACEMENTNAMED: push the page with replacement, this is used mainly when we need to do user authentication.


DOUBTS:
how to judge which variable to declare under build method and which to declare under class