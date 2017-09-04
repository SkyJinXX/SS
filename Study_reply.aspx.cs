using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Study_reply : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "S")
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
        Response.Redirect("Study_notice.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study1.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_test.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_exam.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_discuss.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
       String Sql = "Insert into Ureply Values('"+(String)Session["Cid"]+"','"+(String)Session["username"]+"','"+(String)Session["reply"]+"','"+TextBox1.Text+"')";
        SqlCommand cmd = new SqlCommand(Sql, objConnection);
        cmd.CommandText = Sql;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('发言成功')</script>");
        objConnection.Close();
        TextBox1.Text = "";
            Response.Redirect("Study_discuss.aspx");

    }
}
