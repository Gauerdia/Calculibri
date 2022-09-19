# Calculibri

A platform solution for schools to digitize the daily exercises, let them be corrected automatically,
be shared with people all over the world and see statistics about the performances of the students.
Furthermore, it embeds a communication feature and lets the teacher have an overview over his/her
classes, pending exercises and students.

## Technology

### User interface:
The project has been realized using Flutter and Dart, because these
technologies provide the necessary compatibility to distribute the
platform on android and iOS systems likewise, without writing specific
code for each of them. This enhances the speed of development and is
especially crucial for smaller teams who want to create prototypes of their
idea as fast as possible. Furthermore the technologies are also capable of
being used as a web-interface.

### Backend:
As the backend the service Firebase is proposed. It is not yet implemented but will be
according to the other projects in this GitHub profile.

### Notes:
I designed the paging in this app with as few stateful widgets as possible. I guess this leads to
better performance, but the "back"-button closes the app because of this. So, I suppose it would be
wise to change this paging to a more conventional approach with stateful widgets.+

### Launching the project
It is recommended to use the newest Android Studio IDE, the newest FLutter SDK and to
set up flutter inside of Android Studio. Afterwards this code can be launched via a
virtual smartphone emulator.

## Screenshots
To give an idea of how the project looks like and which features are already included, there
are a few screenshots attached, so that this whole text is more relatable. Furthermore, with
the screenshots it is possible to get an idea of the overall graphic scheme that is proposed
in the beginning.

The profile of the teacher            |  The page to create a new exercise
:-------------------------:|:-------------------------:
<img src="https://github.com/Gauerdia/Calculibri/blob/master/assets/images/screenshots/profile_teacher_1.png?raw=true" width="300" height="680">  |  <img src="https://github.com/Gauerdia/Calculibri/blob/master/assets/images/screenshots/exercise_1.png?raw=true" width="300" height="680">

The profile of the student         |  The statistics about a class
<img src="https://github.com/Gauerdia/Calculibri/blob/master/assets/images/screenshots/student_1.png?raw=true" width="300" height="680">  |  <img src="https://github.com/Gauerdia/Calculibri/blob/master/assets/images/screenshots/statistics_1.png?raw=true" width="300" height="680">

The messaging functionality         |  ...
<img src="https://github.com/Gauerdia/Calculibri/blob/master/assets/images/screenshots/messages_1.png?raw=true" width="300" height="680">  |  