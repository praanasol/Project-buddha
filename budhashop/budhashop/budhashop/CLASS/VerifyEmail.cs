using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;

namespace budhashop.CLASS
{
    public class VerifyEmail
    {
        public static string SmtpServer;
        private enum SMTPResponse : int
        {
            CONNECT_SUCCESS = 220,
            GENERIC_SUCCESS = 250,
            DATA_SUCCESS = 354,
            QUIT_SUCCESS = 221

        }

        public static bool verify(string address)
        {
            string[] host = (address.Split('@'));
            string hostname = host[1];

            IPHostEntry IPhst = Dns.GetHostEntry(hostname); 
            //Dns.GetHostByName
            IPEndPoint endPt = new IPEndPoint(IPhst.AddressList[0], 25);
            Socket s = new Socket(endPt.AddressFamily,
                         SocketType.Stream, ProtocolType.Tcp);
            s.Connect(endPt);

            //Attempting to connect
            if (!Check_Response(s, SMTPResponse.CONNECT_SUCCESS))
            {
                s.Close();
                return false;
            }

            //HELO server
            Senddata(s, string.Format("HELO {0}\r\n", Dns.GetHostName()));
            if (!Check_Response(s, SMTPResponse.GENERIC_SUCCESS))
            {
                s.Close();
                return false;
            }

            //Identify yourself
            //Servers may resolve your domain and check whether 
            //you are listed in BlackLists etc.
            Senddata(s, string.Format("MAIL From: {0}\r\n",
                 "mithunmohan23@gmail.com"));
            if (!Check_Response(s, SMTPResponse.GENERIC_SUCCESS))
            {
                s.Close();
                return false;
            }


            //Attempt Delivery (I can use VRFY, but most 
            //SMTP servers only disable it for security reasons)
            Senddata(s, address);
            if (!Check_Response(s, SMTPResponse.GENERIC_SUCCESS))
            {
                s.Close();
                return false;
            }
            return (true);

        }


        private static void Senddata(Socket s, string msg)
        {

            byte[] _msg = Encoding.ASCII.GetBytes(msg);
            s.Send(_msg, 0, _msg.Length, SocketFlags.None);

        }
        private static bool Check_Response(Socket s, SMTPResponse response_expected)
        {
            string sResponse;
            int response;
            byte[] bytes = BitConverter.GetBytes(0);
            try
            {
                if (!(s.Poll(1, SelectMode.SelectRead) && s.Available == 0))
                {

                    System.Threading.Thread.Sleep(100);

                    s.Receive(bytes, 0, s.Available, SocketFlags.None);
                    sResponse = Encoding.ASCII.GetString(bytes);
                    response = BitConverter.ToInt32(bytes, 0);
                    if (response != (int)response_expected)
                    {
                        return false;

                    }
                    else
                    {
                        return true;
                    }

                }
                else
                {
                    return false;
                }

            }
            catch (SocketException) { return false; }
            
            
            
        }
    }
}
