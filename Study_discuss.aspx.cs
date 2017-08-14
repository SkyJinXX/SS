using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Huiye;

public partial class Study_discuss : System.Web.UI.Page
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
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String SelectSql = "select * from Umessage";
            SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_notice.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mp4play.aspx");

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

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox1.Text.Length, 30)){
            String Sqlstr = "Insert into Umessage values('" + (string)Session["username"] + "','" + TextBox1.Text + "')";
            SqlCommand cmd = new SqlCommand(Sqlstr, objConnection);
            cmd.CommandText = Sqlstr;
            cmd.ExecuteScalar();
            Response.Write("<script>alert('发言成功')</script>");

            //objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String SelectSql = "select * from Umessage";
            SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();
        }
        else
            Response.Write("<script>alert('长度错误')</script>");
        objConnection.Close();
    }


    
}