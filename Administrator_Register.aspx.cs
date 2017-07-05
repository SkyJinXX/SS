
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Huiye;

public partial class Register_Administrator3 : System.Web.UI.Page
{

    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
         Response.Redirect("Administrator.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox3.Text.Length, 10) && Check.CheckLength(TextBox4.Text.Length, 16) && Check.CheckLength(TextBox5.Text.Length, 16))
        {
            String SqlStr = "Select Uusername From Users Where Uusername = '" + TextBox3.Text + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            if (cmd.ExecuteScalar() != null)
                Response.Write("<script>alert('用户名已存在')</script>");
            else
            {
                String st1 = TextBox4.Text;
                String st2 = TextBox5.Text;
                int l1 = st1.Length;
                int l2 = st2.Length;
                if (l1 == l2 && (TextBox4.Text == TextBox5.Text))
                {
                    SqlStr = "Insert into Users values('" + TextBox3.Text + "', '" + TextBox4.Text  + "', '" + "A" + "')";
                    cmd.CommandText = SqlStr;
                    cmd.ExecuteScalar();
                    

                    if (Check.CheckLength(TextBox1.Text.Length, 10) && Check.CheckLength(TextBox2.Text.Length, 10))
                    {
                        String SqlStr1 = "Insert into Administrator values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + (string)RadioButtonList3.SelectedValue + "', '" + (String)RadioButtonList4.SelectedValue + "')";
                        SqlCommand cmd1 = new SqlCommand(SqlStr1, objConnection);
                        cmd1.CommandText = SqlStr1;
                        cmd1.ExecuteScalar();

                        String SqlStr2 = "Insert into A_U values('" + TextBox1.Text + "' , '" + (string)Session["username"] + "')";
                        SqlCommand cmd2 = new SqlCommand(SqlStr2, objConnection);
                        cmd2.CommandText = SqlStr2;
                        cmd2.ExecuteScalar();

                        Response.Write("<script>alert('注册成功');window.location.href='Administrator.aspx'</script>");
                    }
                    else
                        Response.Write("<script>alert('长度错误')</script>");
                    objConnection.Close();
                }
            }
        }
    }

    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}