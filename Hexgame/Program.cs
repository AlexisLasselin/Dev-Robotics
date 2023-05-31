namespace Hexgame;
using HexgameGame;
using HexgameDisplay;

static class Program
{

    [STAThread]
    static void Main()
    {
        HexgameGame game = new HexgameGame(11, Color.Red, Color.Blue);

        ApplicationConfiguration.Initialize();
        Application.Run(new Display());
    }

}