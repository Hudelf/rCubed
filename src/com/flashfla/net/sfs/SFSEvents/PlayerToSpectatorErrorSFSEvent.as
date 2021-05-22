package com.flashfla.net.sfs.SFSEvents
{
    import com.flashfla.net.sfs.TypedSFSEvent;
    import com.smartfoxserver.v2.core.SFSEvent;

    public class PlayerToSpectatorErrorSFSEvent extends TypedSFSEvent
    {
        private var _errorMessage:String;
        private var _errorCode:int;

        public function get errorMessage():String
        {
            return _errorMessage;
        }

        public function get errorCode():int
        {
            return _errorCode;
        }

        public function PlayerToSpectatorErrorSFSEvent(params:Object)
        {
            super(SFSEvent.INVITATION_REPLY_ERROR);

            this._errorMessage = params.error;
            this._errorCode = params.errorCode;
        }
    }
}
