using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Huiye;

public partial class Register_Student1 : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox1.Text.Length, 10) && Check.CheckLength(TextBox2.Text.Length, 8)&&Check.CheckLength(TextBox3.Text.Length, 20)
           && Check.CheckLength(TextBox4.Text.Length, 3) && Check.CheckLength(TextBox5.Text.Length, 15) && Check.CheckLength(TextBox6.Text.Length, 15)
           && Check.CheckLength(TextBox7.Text.Length, 15) && Check.CheckLength(TextBox7.Text.Length, 10) && Check.CheckLength(TextBox2.Text.Length, 11))
        {

            String SqlStr = "Insert into Student values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + (string)RadioButtonList1.SelectedValue + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "')";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            cmd.CommandText = SqlStr;
            cmd.ExecuteScalar();

            String SqlStr1 = "Insert into S_U values('" + TextBox1.Text + "' , '" + (string)Session["username1"] + "')";
            SqlCommand cmd1 = new SqlCommand(SqlStr1, objConnection);
            cmd1.CommandText = SqlStr1;
            cmd1.ExecuteScalar();

            Response.Redirect("Default.aspx");
        }
        else
            Response.Write("<script>alert('长度错误')</script>");
        objConnection.Close();
    }
}