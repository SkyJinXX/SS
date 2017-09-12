using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Huiye;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(input.Text.Length, 10) && Check.CheckLength(input1.Text.Length, 16) && Check.CheckLength(input3.Text.Length, 16))
        {
            
            String SqlStr = "Select Uusername From Users Where Uusername = '" + input.Text + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            if (cmd.ExecuteScalar() != null)
                Response.Write("<script>alert('用户名已存在')</script>");
            else
            {
                String st1 = input1.Text;
                String st2 = input3.Text;
                int l1 = st1.Length;
                int l2 = st2.Length;
                if (l1 == l2&&(input1.Text== input3.Text))
                {
                    //SqlStr = "Insert into Users values('" + TextBox1.Text + "', '" + TextBox2.Text  + "', '" + (string)Identity.SelectedValue + "')";
                    //cmd.CommandText = SqlStr;
                    //cmd.ExecuteScalar();
                   // Response.Write("<script>alert('注册成功')</script>");
                   if(Identity.SelectedValue != "T" && Identity.SelectedValue != "A" && Identity.SelectedValue != "S")
                    {
                        Response.Write("<script>alert('请选择身份')</script>");
                    }
                    else
                    {
                        Session["username1"] = input.Text;
                        SqlStr = "Insert into Users values('" + input.Text + "', '" + input1.Text + "', '" + (string)Identity.SelectedValue + "')";
                        cmd.CommandText = SqlStr;
                        cmd.ExecuteScalar();

                        if (Identity.SelectedValue == "T")
                        {
                            Response.Redirect("Register_Teacher.aspx");
                        }

                        else if (Identity.SelectedValue == "S")
                        {
                            Response.Redirect("Register_Student.aspx");
                        }

                    }
                }
                else
                    Response.Write("<script>alert('密码不一致')</script>");
            }
        }
        else
            Response.Write("<script>alert('长度错误')</script>");
        objConnection.Close();
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            String S = input1.Text;
            String S1 = input3.Text;

            input1.TextMode = TextBoxMode.SingleLine;
            input3.TextMode = TextBoxMode.SingleLine;

            input1.Text = S;
            input3.Text = S1;
        }
        if(CheckBox1.Checked == false)
        {
            String S = input1.Text;
            String S1 = input3.Text;

            input1.TextMode = TextBoxMode.Password;
            input3.TextMode = TextBoxMode.Password;

            input1.Attributes["value"] = S;
            input3.Attributes["value"] = S1;

        }

    }
}