package game.controls
{
    import com.flashfla.utils.ColorUtil;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldAutoSize;
    import flash.text.AntiAliasType;
    import game.GameOptions;
    import classes.Language;

    public class Combo extends Sprite
    {
        public static const ALIGN_LEFT:String = TextFieldAutoSize.LEFT;
        public static const ALIGN_RIGHT:String = TextFieldAutoSize.RIGHT;

        private var options:GameOptions;

        private var colors:Array = [];
        private var darkcolors:Array = [];

        private var field:TextField;
        private var fieldShadow:TextField;

        public function Combo(options:GameOptions)
        {
            this.options = options;

            for (var i:int = 0; i < options.comboColours.length; i++)
            {
                colors[i] = options.comboColours[i];
                darkcolors[i] = ColorUtil.darkenColor(options.comboColours[i], 0.5);
            }

            fieldShadow = new TextField();
            fieldShadow.defaultTextFormat = new TextFormat(Language.UNI_FONT_NAME, 50, darkcolors[2], true);
            fieldShadow.antiAliasType = AntiAliasType.ADVANCED;
            fieldShadow.embedFonts = true;
            fieldShadow.selectable = false;
            fieldShadow.autoSize = TextFieldAutoSize.LEFT;
            fieldShadow.x = 2;
            fieldShadow.y = 2;
            fieldShadow.text = "0";
            addChild(fieldShadow);

            field = new TextField();
            field.defaultTextFormat = new TextFormat(Language.UNI_FONT_NAME, 50, colors[2], true);
            field.antiAliasType = AntiAliasType.ADVANCED;
            field.embedFonts = true;
            field.selectable = false;
            field.autoSize = TextFieldAutoSize.LEFT;
            field.x = 0;
            field.y = 0;
            field.text = "0";
            addChild(field);

            if (options && options.isAutoplay && !options.isEditor && !options.multiplayer)
            {
                field.textColor = 0xD00000;
                fieldShadow.textColor = 0x5B0000;
            }
        }

        public function update(combo:int, userComboOptions:Array, amazing:int = 0, perfect:int = 0, good:int = 0, average:int = 0, miss:int = 0, boo:int = 0, raw_goods:Number = 0):void
        {
            field.text = combo.toString();
            fieldShadow.text = combo.toString();

            /* colors[i]:
               [0] = Normal,
               [1] = FC,
               [2] = AAA,
               [3] = SDG,
               [4] = Black Flag,
               [5] = Average Flag,
               [6] = Boo Flag,
               [7] = Miss Flag
             */

            if (options && (!options.isAutoplay || options.isEditor || options.multiplayer))
            {
                if (userComboOptions[2] && good + average + boo + miss == 0) // Display AAA color
                {
                    field.textColor = colors[2];
                    fieldShadow.textColor = darkcolors[2];
                }
                else if (userComboOptions[4] && good == 1 && average + boo + miss == 0) // Display Black Flag color
                {
                    field.textColor = colors[4];
                    fieldShadow.textColor = darkcolors[4];
                }
                else if (userComboOptions[5] && average == 1 && good + boo + miss == 0) // Display Average Flag color
                {
                    field.textColor = colors[5];
                    fieldShadow.textColor = darkcolors[5];
                }
                else if (userComboOptions[6] && boo == 1 && good + average + miss == 0) // Display Boo Flag color
                {
                    field.textColor = colors[6];
                    fieldShadow.textColor = darkcolors[6];
                }
                else if (userComboOptions[7] && miss == 1 && good + average + boo == 0) // Display Miss Flag color
                {
                    field.textColor = colors[7];
                    fieldShadow.textColor = darkcolors[7];
                }
                else if (userComboOptions[3] && raw_goods < 10) // Display SDG color if raw goods < 10
                {
                    field.textColor = colors[3];
                    fieldShadow.textColor = darkcolors[3];
                }
                else if (userComboOptions[1] && miss == 0) // Display green for FC
                {
                    field.textColor = colors[1];
                    fieldShadow.textColor = darkcolors[1];
                }
                else // Display blue combo text
                {
                    field.textColor = colors[0];
                    fieldShadow.textColor = darkcolors[0];
                }
            }
        }

        public function set alignment(value:String):void
        {
            field.autoSize = value;
            fieldShadow.autoSize = value;
        }
    }
}
