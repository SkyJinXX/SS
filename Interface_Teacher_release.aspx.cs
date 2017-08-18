using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_Teacher_release : System.Web.UI.Page
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
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql = "Insert into Trelease Values('" + (String)Session["release"] + "','" + TextBox1.Text + "')";
        SqlCommand cmd = new SqlCommand(Sql, objConnection);
        cmd.CommandText = Sql;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('发布公告成功')</script>");
        objConnection.Close();
        TextBox1.Text = "";
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate.aspx");
    }
}