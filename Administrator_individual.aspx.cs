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
            Label1.Text = (String)Session["name"];
        }
        if (!Page.IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

            cmd.CommandText = "select Aid from A_U where Uusername = '"+ (String)Session["username"] + "' ";
            TextBox1.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Aname from Administrator where Aid = '" + TextBox1.Text + "'";
            TextBox2.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Asex from Administrator where Aid = '" + TextBox1.Text + "'";
            RadioButtonList1.SelectedValue = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Abirthday from Administrator where Aid = '" + TextBox1.Text + "'";
            TextBox4.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Aage from Administrator where Aid = '" + TextBox1.Text + "'";
            TextBox5.Text = (String)cmd.ExecuteScalar();

            cmd.CommandText = "select Alevel from Administrator where Aid = '" + TextBox1.Text + "'";
            TextBox6.Text = (String)cmd.ExecuteScalar();

            objConnection.Close();

            Button1.Attributes.Add("onclick", "return confirm('确认修改?')");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);

        cmd.CommandText = "select Aid from A_U where Uusername = '" + (String)Session["username"] + "' ";
        String id = (String)cmd.ExecuteScalar();

        cmd.CommandText = "select Aname from Administrator where Aid in ( select Aid from A_U where Uusername = '"
                + (String)Session["username"] + "')";
        String name = (String)cmd.ExecuteScalar();

        cmd.CommandText = "update  A_A_Announcement set Aname1 = '" + TextBox2.Text + "' where  Aname1 = '" + name
            + "' and Aid1 = '" + id + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update  A_A_Announcement set Aname2 = '" + TextBox2.Text + "' where Aname2 = '" + name
            + "' and Aid2 = '" + id + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update  A_S_Announcement set Aname = '" + TextBox2.Text + "' where Aname = '" + name
            + "' and Aid = '" + id + "'";
        cmd.ExecuteScalar();

        cmd.CommandText = "update  A_T_Announcement set Aname = '" + TextBox2.Text + "' where Aname = '" + name
            + "' and Aid = '" + id + "'";
        cmd.ExecuteScalar();

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

        Session["name"] = TextBox2.Text;
        Label1.Text = TextBox2.Text;

        Response.Write("<script>alert('修改成功')</script>");
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Session["name"] = null;
        Response.Redirect("Default.aspx");
    }
}