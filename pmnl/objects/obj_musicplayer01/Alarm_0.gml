/// @desc stop playing

active = false;
alarm[1] = -1;

audio_stop_sound(mus_pixelmall_musicbox);
audio_resume_all();