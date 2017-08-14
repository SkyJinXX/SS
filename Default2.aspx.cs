using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
     //DateTime NowTime;//当前时间  
     //DateTime EndTime = Convert.ToDateTime("2017-8-13 23:59:59");//结束时间  
    TimeSpan CountdownSpan;//时间间隔  
   // TimeSpan CountdownSpan = new TimeSpan(0, 20, 0);

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            this.Timer1.Enabled = true;
            TimeSpan CountdownSpan = new TimeSpan(0, 20, 0);

            //NowTime = DateTime.Now;
            //CountdownSpan = EndTime - NowTime;
            if (CountdownSpan.TotalSeconds > 0)
            {
                lblTimerDays.Text = CountdownSpan.Days.ToString();
                lblTimerHours.Text = CountdownSpan.Hours > 10 ? CountdownSpan.Hours.ToString() : "0" + CountdownSpan.Hours.ToString();
                lblTimerMinutes.Text = CountdownSpan.Minutes > 10 ? CountdownSpan.Minutes.ToString() : "0" + CountdownSpan.Minutes.ToString();
                lblTimerSeconds.Text = CountdownSpan.Seconds > 10 ? CountdownSpan.Seconds.ToString() : "0" + CountdownSpan.Seconds.ToString();
            }
        }
    }

    protected void Timer1_Tick1(object sender, EventArgs e)
    {
        TimeSpan CountdownSpan = new TimeSpan(0, 20, 0);
        //NowTime = DateTime.Now;
        // CountdownSpan = EndTime - NowTime;
        CountdownSpan = CountdownSpan.Subtract(new TimeSpan(0, 0, 1));//每隔一秒减去一秒

        if (CountdownSpan.TotalSeconds > 0)
        {
            lblTimerDays.Text = CountdownSpan.Days.ToString();
            lblTimerHours.Text = CountdownSpan.Hours > 10 ? CountdownSpan.Hours.ToString() : "0" + CountdownSpan.Hours.ToString();
            lblTimerMinutes.Text = CountdownSpan.Minutes > 10 ? CountdownSpan.Minutes.ToString() : "0" + CountdownSpan.Minutes.ToString();
            lblTimerSeconds.Text = CountdownSpan.Seconds > 10 ? CountdownSpan.Seconds.ToString() : "0" + CountdownSpan.Seconds.ToString();
        }
    }
}