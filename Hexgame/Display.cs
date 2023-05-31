namespace HexgameDisplay;
using HexgameGame;

public partial class Display : Form
{

    public Display()
    {
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(800, 450);
        this.Text = "HexGame";

        this.Click += onClick;
        this.Paint += draw;

        BringForward();
    }

    private void onClick(object? sender, EventArgs e)
    {
        Point cursor = this.PointToClient(Cursor.Position);
        
        // TODO
        // Pixel clicked at (cursor.X, cursor.Y)
        // Hint: Use ScreenToGrid
    }

    private void draw(object? sender, PaintEventArgs e) {
        Graphics g = e.Graphics;

        // TODO

        // Example:
        int width = 10;
        SolidBrush brush = new SolidBrush(Color.Red);
        Pen pen = new Pen(Color.Black, width);

        // var points1 = new PointF[] {
        //     new PointF(460, 70),
        //     new PointF(80, 280),
        //     new PointF(400, 320)
        // };
        // var points2 = new PointF[] {
        //     new PointF(340, 200),
        //     new PointF(720, 70),
        //     new PointF(740, 370),
        //     new PointF(250, 400)
        // };

        // g.FillPolygon(brush, points1);
        // g.DrawPolygon(pen, points2);

        // Hint: Use drawCell*

        
    }

    private (int, int) screenToGrid(Point cursor)
    {
        throw new NotImplementedException();
    }

    private void drawCell(Graphics g, int q, int r, Color color)
    {
        throw new NotImplementedException();

        // https://web.archive.org/web/20220814215842/https://www.redblobgames.com/grids/hexagons/
        // https://web.archive.org/web/20230225215201/https://www.redblobgames.com/grids/hexagons/more-pixel-to-hex.html
    }

    public void BringForward()
    {
        this.WindowState = FormWindowState.Minimized;
        this.Show();
        this.WindowState = FormWindowState.Normal;
    }

}
