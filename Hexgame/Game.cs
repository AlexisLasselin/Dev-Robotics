namespace HexgameGame;

public class HexgameGame {

    public int Size { get; }
    public Color ColorP1 { get; }
    public Color ColorP2 { get; }

    public HexgameGame(int size, Color colorP1, Color colorP2)
    {
        this.Size = size;
        this.ColorP1 = colorP1;
        this.ColorP2 = colorP2;
    }

}