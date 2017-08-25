using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
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
            Label2.Text = (String)Session["username"];
        }
        TextBox5.Enabled = false;

        if (!Page.IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

            cmd.CommandText = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
            TextBox5.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sname from Student where Sid = '" + TextBox5.Text + "'";
            TextBox1.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Ssex from Student where Sid = '" + TextBox5.Text + "'";
            RadioButtonList1.SelectedValue = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sbirthday from Student where Sid = '" + TextBox5.Text + "'";
            TextBox6.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sage from Student where Sid = '" + TextBox5.Text + "'";
            TextBox7.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sschool from Student where Sid = '" + TextBox5.Text + "'";
            TextBox8.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Scollege from Student where Sid = '" + TextBox5.Text + "'";
            TextBox9.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Smajor from Student where Sid = '" + TextBox5.Text + "'";
            TextBox2.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sclass from Student where Sid = '" + TextBox5.Text + "'";
            TextBox3.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Sphone from Student where Sid = '" + TextBox5.Text + "'";
            TextBox4.Text = (String)cmd.ExecuteScalar();

            objConnection.Close();
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();

        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

        cmd.CommandText = "update A_S_Announcement set Sname = '" + TextBox1.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        Session["name"] = TextBox1.Text;
        Label1.Text = TextBox1.Text;

        cmd.CommandText = "update Student set Ssex = '" + RadioButtonList1.SelectedValue + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sbirthday = '" + TextBox6.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sage = '" + TextBox7.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sschool = '" + TextBox8.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Scollege = '" + TextBox9.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sname = '" + TextBox1.Text +  "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Smajor = '" + TextBox2.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sclass = '" + TextBox3.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Student set Sphone = '" + TextBox4.Text + "' where Sid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        objConnection.Close();
        Response.Write("<script>alert('修改成功');window.location.href='Interface_Student_Change.aspx'</script>");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}