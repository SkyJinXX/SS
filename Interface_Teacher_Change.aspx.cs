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

        TextBox5.Enabled = false;
        TextBox7.Enabled = false;

        if (!Page.IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

            cmd.CommandText = "select Tid from T_U where Uusername = '" + (String)Session["username"] + "'";
            TextBox5.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tbirthday from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox2.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tprofession from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox3.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tphone from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox4.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tintroduction from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox1.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tname from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox6.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tsex from Teacher where Tid = '" + TextBox5.Text + "'";
            RadioButtonList1.SelectedValue = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Tlevel from Teacher where Tid = '" + TextBox5.Text + "'";
            TextBox7.Text = cmd.ExecuteScalar().ToString();

            objConnection.Close();
        }
    }

    

    protected void Button6_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();

        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

        cmd.CommandText = "update A_T_Announcement set Tname = '" + TextBox6.Text + "' where Tid = '" 
            + TextBox5.Text + "'";
        cmd.ExecuteNonQuery();

        Session["name"] = TextBox6.Text;
        Label1.Text = TextBox6.Text;

        cmd.CommandText = "update Teacher set Tname = '" + TextBox6.Text + "' where Tid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Teacher set Tsex = '" + RadioButtonList1.SelectedValue + "' where Tid = '" 
            + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Teacher set Tbirthday = '" + TextBox2.Text + "' where Tid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Teacher set Tprofession = '" + TextBox3.Text + "' where Tid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Teacher set Tphone = '" + TextBox4.Text + "' where Tid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Teacher set Tintroduction = '" + TextBox1.Text + "' where Tid = '" + TextBox5.Text + "'";
        cmd.ExecuteScalar();

        objConnection.Close();
        Response.Write("<script>alert('修改成功')</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher.aspx");
    }
}