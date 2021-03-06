﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "A")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label1.Text = (String)Session["name"];
        }

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String a = "select Aname from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd1 = new SqlCommand(a, objConnection);

        String SelectSql = "select Aname1, Aname2, A_A_Message, A_A_Action from A_A_Announcement where Aid1 = ( select " +
            "Aid from A_U where Uusername = '" + (String)Session["username"] + "')" + " or Aid2 = ( select Aid " +
            "from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();


        a = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        cmd1 = new SqlCommand(a, objConnection);
        int b = Convert.ToInt32(cmd1.ExecuteScalar());
        if(b < 2)
        {
            Button2.Enabled = false;
            Button2.ForeColor = System.Drawing.Color.Gray;
        }
        if(b < 3)
        {
            Button3.Enabled = false;
            Button3.ForeColor = System.Drawing.Color.Gray;
        }
        if (b < 4)
        {
            Button4.Enabled = false;
            Button4.ForeColor = System.Drawing.Color.Gray;
        }
        if (b < 5)
        {
            Button5.Enabled = false;
            Button5.ForeColor = System.Drawing.Color.Gray;
        }
        if (b < 6)
        {
            Button8.Enabled = false;
            Button8.ForeColor = System.Drawing.Color.Gray;
        }
        if (b < 7)
        {
            Button9.Enabled = false;
            Button9.ForeColor = System.Drawing.Color.Gray;
        }

        objConnection.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_RightsManagement.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_Register.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_UsersManagement.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_TranscriptManagement.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_CourseManagement.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Session["name"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_individual.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_announcement.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_InformationManagement.aspx");
    }
}