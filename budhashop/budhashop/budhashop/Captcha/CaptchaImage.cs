using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

namespace budhashop.Captcha
{
	/// <summary>
	/// Summary description for CaptchaImage.
	/// </summary>
	public class CaptchaImage
	{
		// Public properties (all read-only).
		public string Text
		{
			get { return this.text; }
		}
		public Bitmap Image
		{
			get { return this.image; }
		}
		public int Width
		{
			get { return this.width; }
		}
		public int Height
		{
			get { return this.height; }
		}

		// Internal properties.
		private string text;
		private int width;
		private int height;
		private string familyName;
		private Bitmap image;

		// For generating random numbers.
		private Random random = new Random();

        private static int GetRandomNumber(int maxNumber)
        {
            if (maxNumber < 1)
                throw new System.Exception("The maxNumber value should be greater than 1");
            byte[] b = new byte[4];
            new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
            int seed = (b[0] & 0x7f) << 24 | b[1] << 16 | b[2] << 8 | b[3];
            System.Random r = new System.Random(seed);
            return r.Next(1, maxNumber);
        }
        // Returns a Random String.
        public static string GenerateRandomCode(int length)
        {
            string[] array = new string[54]
            {
		        "0","2","3","4","5","6","8","9",
		        "a","b","c","d","e","f","g","h","j","k","m","n","p","q","r","s","t","u","v","w","x","y","z",
		        "A","B","C","D","E","F","G","H","J","K","L","M","N","P","R","S","T","U","V","W","X","Y","Z"
            };
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < length; i++)
            {
                sb.Append(array[GetRandomNumber(53)]);
            }
            return sb.ToString();
        }

		// ====================================================================
		// Initializes a new instance of the CaptchaImage class using the
		// specified text, width and height.
		// ====================================================================
		public CaptchaImage(string s, int width, int height)
		{
			this.text = s;
			this.SetDimensions(width, height);
			this.GenerateImage();
		}

		// ====================================================================
		// Initializes a new instance of the CaptchaImage class using the
		// specified text, width, height and font family.
		// ====================================================================
		public CaptchaImage(string s, int width, int height, string familyName)
		{
			this.text = s;
			this.SetDimensions(width, height);
			this.SetFamilyName(familyName);
			this.GenerateImage();
		}

		// ====================================================================
		// This member overrides Object.Finalize.
		// ====================================================================
		~CaptchaImage()
		{
			Dispose(false);
		}

		// ====================================================================
		// Releases all resources used by this object.
		// ====================================================================
		public void Dispose()
		{
			GC.SuppressFinalize(this);
			this.Dispose(true);
		}

		// ====================================================================
		// Custom Dispose method to clean up unmanaged resources.
		// ====================================================================
		protected virtual void Dispose(bool disposing)
		{
			if (disposing)
				// Dispose of the bitmap.
				this.image.Dispose();
		}

		// ====================================================================
		// Sets the image width and height.
		// ====================================================================
		private void SetDimensions(int width, int height)
		{
			// Check the width and height.
			if (width <= 0)
				throw new ArgumentOutOfRangeException("width", width, "Argument out of range, must be greater than zero.");
			if (height <= 0)
				throw new ArgumentOutOfRangeException("height", height, "Argument out of range, must be greater than zero.");
			this.width = width;
			this.height = height;
		}

		// ====================================================================
		// Sets the font used for the image text.
		// ====================================================================
		private void SetFamilyName(string familyName)
		{
			// If the named font is not installed, default to a system font.
			try
			{
				Font font = new Font(this.familyName, 12F);
				this.familyName = familyName;
				font.Dispose();
			}
			catch (Exception ex)
			{
				this.familyName = System.Drawing.FontFamily.GenericSerif.Name;
			}
		}

		// ====================================================================
		// Creates the bitmap image.
		// ====================================================================
		private void GenerateImage()
		{
			// Create a new 32-bit bitmap image.
			Bitmap bitmap = new Bitmap(this.width, this.height, PixelFormat.Format32bppArgb);

			// Create a graphics object for drawing.
			Graphics g = Graphics.FromImage(bitmap);
			g.SmoothingMode = SmoothingMode.AntiAlias;
			Rectangle rect = new Rectangle(0, 0, this.width, this.height);

			// Fill in the background.
                    SolidBrush whiteBrush = new SolidBrush(Color.LightBlue);
                    g.FillRectangle(whiteBrush, rect);
                    //HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.LightGray, Color.White);
			        //g.FillRectangle(hatchBrush, rect);

			// Set up the text font.
			SizeF size;
			float fontSize = rect.Height + 1;
			Font font;
			// Adjust the font size until the text fits within the image.
			do
			{
				fontSize--;
				font = new Font(this.familyName, fontSize, FontStyle.Regular);
				size = g.MeasureString(this.text, font);
			} while (size.Width > rect.Width);

			// Set up the text format.
			StringFormat format = new StringFormat();
			format.Alignment = StringAlignment.Center;
			format.LineAlignment = StringAlignment.Center;

			// Create a path using the text and warp it randomly.
			GraphicsPath path = new GraphicsPath();
			path.AddString(this.text, font.FontFamily, (int) font.Style, font.Size, rect, format);
			float v = 14F;
			PointF[] points =
			{
				new PointF(this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
				new PointF(rect.Width - this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
				new PointF(this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v),
				new PointF(rect.Width - this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v)
			};
			Matrix matrix = new Matrix();
			matrix.Translate(-5F, 0F);
			path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);

			// Draw the text.
                        whiteBrush = new SolidBrush(Color.Maroon);
                        g.FillPath(whiteBrush, path);
                        //hatchBrush = new HatchBrush(HatchStyle.LargeConfetti, Color.Red, Color.DarkGray);
                        //g.FillPath(hatchBrush, path);

			// Add some random noise.
			int m = Math.Max(rect.Width, rect.Height);
			for (int i = 0; i < (int) (rect.Width * rect.Height / 30F); i++)
			{
				int x = this.random.Next(rect.Width);
				int y = this.random.Next(rect.Height);
				int w = this.random.Next(m / 40);
				int h = this.random.Next(m / 40);
				        g.FillEllipse(whiteBrush, x, y, w, h);
			}

			// Clean up.
			font.Dispose();
                    whiteBrush.Dispose();
			g.Dispose();

			// Set the image.
			this.image = bitmap;
		}
	}
}
