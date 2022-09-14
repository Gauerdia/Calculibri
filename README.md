# Calculibri

A platform solution for schools to digitize the daily exercises, let them be corrected automatically,
be shared with people all over the world and see statistics about the performances of the students.
Furthermore, it embeds a communication feature and lets the teacher have an overview over his/her
classes, pending exercises and students.

## Technical notes

I designed the paging in this app with as few stateful widgets as possible. I guess this leads to
better performance, but the "back"-button closes the app because of this. So, I suppose it would be
wise to change this paging to a more conventional approach with stateful widgets.

