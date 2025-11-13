/// @desc

spd = 1;

image_alpha = 0.5;
image_xscale = 0.5;
image_yscale = 0.5;
if (irandom(1)) {
	sprite_index = spr_music_dot01;
} else {
	sprite_index = spr_music_dot02;
}

//public PrettyObject createMusicNote() {
//    PrettyObject musicNote = new PrettyObject();
//    if (new Random().nextInt(100) > 50) {
//        musicNote.initSpriteWithFile("music_dot01.png");
//    } else {
//        musicNote.initSpriteWithFile("music_dot02.png");
//    }
//    musicNote.sprite().setPosition(CGPoint.make(GameUnit.getDeviceScreenSize().width, (GameUnit.getDeviceScreenSize().height / 2.0f) + ((float) (Math.round(Math.random()) % ((long) Math.round(GameUnit.getDeviceScreenSize().height / 4.0f))))));
//    musicNote.sprite().setRotation(-30.0f);
//    musicNote.sprite().setUserInteractionEnabled(false);
//    CCSequence action3 = CCSequence.actions(CCRotateBy.action(0.6f, 60.0f), CCRotateBy.action(0.6f, -60.0f));
//    CCSequence action2 = CCSequence.actions(CCDelayTime.action(3.0f), CCFadeTo.action(0.5f, 0));
//    CCSpawn action0 = CCSpawn.actions(CCSequence.actions(CCFadeTo.action(0.5f, 128), action2), CCRepeat.action(action3, 4));
//    musicNote.sprite().runAction(CCSpawn.actions(CCMoveTo.action(4.0f, CGPoint.make(-20.0f, musicNote.sprite().getPosition().y)), action0));
//    return musicNote;
//}