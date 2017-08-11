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
        else if ((String)Session["identity"] != "A")
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

            cmd.CommandText = "select Aid from A_U where Uusername = '"+ (String)Session["username"] + "' ";
            TextBox1.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Aname from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox2.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Asex from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
            RadioButtonList1.SelectedValue = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Abirthday from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox4.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Aage from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox5.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
            TextBox6.Text = (String)cmd.ExecuteScalar();

            objConnection.Close();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

        cmd.CommandText = "update Administrator set Aname = '" + TextBox2.Text + "' where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Administrator set Asex = '" + RadioButtonList1.SelectedValue + "' where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Administrator set Abirthday = '" + TextBox4.Text + "' where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
        cmd.ExecuteScalar();

        cmd.CommandText = "update Administrator set Aage = '" + TextBox5.Text + "' where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
        cmd.ExecuteScalar();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }
}