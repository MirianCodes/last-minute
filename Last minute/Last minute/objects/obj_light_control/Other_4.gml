if (room == Room1 && !global.intro_done) {
    global.intro_active = true;
    cur_radius = 0;
    intro_wait = 0;
    show_dialogue([
        "...Where am I?",
        "I woke up in some kind of laboratory. I can't remember how I got here.",
        "The power's out. Wait, there's a flashlight on the floor.",
        "I'll take it. I have to find a way out of here."
    ]);
}