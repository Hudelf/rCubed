package it.gotoandplay.smartfoxserver.SFSEvents
{

    import it.gotoandplay.smartfoxserver.TypedSFSEvent;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import classes.Room

    public class RoomAddedSFSEvent extends TypedSFSEvent
    {
        public var room:Room;

        public function RoomAddedSFSEvent(params:Object)
        {
            super(SFSEvent.onRoomAdded);
            room = params.room;
        }
    }
}
