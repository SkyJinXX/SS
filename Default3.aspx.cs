using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Timer1.Enabled = true;

    }
    TimeSpan ts = new TimeSpan(0, 0, 10);
    protected void Timer1_Tick(object sender, EventArgs e)
    {

            String str = ts.Hours.ToString() + ":"+ ts.Minutes.ToString() + ":"+ ts.Seconds.ToString();



            Label1.Text= str;//label17用来显示剩余的时间



            ts= ts.Subtract(new TimeSpan(0, 0, 1));//每隔一秒减去一秒



            if(ts.TotalSeconds < 0.0)//当倒计时完毕

            {



                Timer1.Enabled= false;

            //MessageBox.Show("考试时间到，系统将强行交卷");//提示时间到,下面可以加你想要的操作
            Response.Write("<script>alert('考试时间到，系统将强行交卷')</script>");


        }



    }
}