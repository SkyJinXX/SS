using System;
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
        else if ((String)Session["identity"] != "T")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        if (!Page.IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
            cmd.CommandText = "select Tbirthday from Teacher where Tid = ( select Tid from T_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox2.Text = (String)cmd.ExecuteScalar();
            cmd.CommandText = "select Tprofession from Teacher where Tid = ( select Tid from T_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox3.Text = (String)cmd.ExecuteScalar();
            cmd.CommandText = "select Tphone from Teacher where Tid = ( select Tid from T_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox4.Text = (String)cmd.ExecuteScalar();
            cmd.CommandText = "select Tintroduction from Teacher where Tid = ( select Tid from T_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox1.Text = (String)cmd.ExecuteScalar();
            objConnection.Close();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Rank.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();

        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        cmd.CommandText = "update Teacher set Tbirthday = '" + TextBox2.Text +
            "' where Tid = (select Tid from T_U where Uusername ='" + (String)Session["username"] + "')";
        cmd.ExecuteScalar();
        cmd.CommandText = "update Teacher set Tprofession = '" + TextBox3.Text +
            "' where Tid = (select Tid from T_U where Uusername ='" + (String)Session["username"] + "')";
        cmd.ExecuteScalar();
        cmd.CommandText = "update Teacher set Tphone = '" + TextBox4.Text +
            "' where Tid = (select Tid from T_U where Uusername ='" + (String)Session["username"] + "')";
        cmd.ExecuteScalar();
        cmd.CommandText = "update Teacher set Tintroduction = '" + TextBox1.Text +
            "' where Tid = (select Tid from T_U where Uusername ='" + (String)Session["username"] + "')";
        cmd.ExecuteScalar();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }
    
}