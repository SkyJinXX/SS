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
    String AD = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();

        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "A")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else {
            Label3.Text = (String)Session["name"];
        }

        String st = "";
        SqlCommand cmd3 = new SqlCommand(st, objConnection);
        cmd3.CommandText = "select count(*) from Administrator";
        AD = Convert.ToString((int)cmd3.ExecuteScalar()+1);
        if (AD.Length <= 3)
        {
            String s = "";
            for (int i = 3 - AD.Length; i > 0; i--)
                s += "0";
            s += AD;
            AD = s;
        }
        TextBox4.Text = AD;

        String selectlevel = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd = new SqlCommand(selectlevel, objConnection);
        int levelc = Convert.ToInt32((String)cmd.ExecuteScalar());
        for (int i = levelc + 1; i < 6; i++)
            RadioButtonList4.Items[5 - i].Enabled = false;

        objConnection.Close();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
         Response.Redirect("Administrator.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox1.Text.Length, 12) && Check.CheckLength(TextBox2.Text.Length, 16) 
            && Check.CheckLength(TextBox3.Text.Length, 16) )
        {
            String SqlStr = "Select Uusername From Users Where Uusername = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            if (cmd.ExecuteScalar() != null)
                Response.Write("<script>alert('用户名已存在')</script>");
            else
            {
                String st1 = TextBox2.Text;
                String st2 = TextBox3.Text;
                int l1 = st1.Length;
                int l2 = st2.Length;
                if (l1 == l2 && (TextBox2.Text == TextBox3.Text))
                {
                    SqlStr = "Insert into Users values('" + TextBox1.Text + "', '" + TextBox2.Text  + "', '" + "A" + "')";
                    cmd.CommandText = SqlStr;
                    cmd.ExecuteScalar();
                    
                    if (Check.CheckLength(TextBox4.Text.Length, 10) && Check.CheckLength(TextBox5.Text.Length, 10)
                        && Check.CheckLength(TextBox6.Text.Length, 10) && Check.CheckLength(TextBox7.Text.Length, 5))
                    {
                        int levea = Convert.ToInt32((String)TextBox3.Text);
                        String selectlevel = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
                        cmd = new SqlCommand(selectlevel, objConnection);
                        int levelc = Convert.ToInt32((String)cmd.ExecuteScalar());
                        int levelb = Convert.ToInt32((String)RadioButtonList4.SelectedValue);

                        if (levelc <= levelb)
                        {
                            Response.Write("<script>alert('无法赋值比自身权限更高或相同的权限，请重新选择正确权限')</script>");
                        }
                        else
                        {
                            String SqlStr1 = "Insert into Administrator values('" + (String)AD + "', '" + TextBox5.Text
                                + "', '" + (string)RadioButtonList3.SelectedValue + "', '" + TextBox6.Text + "', '"
                                + TextBox7.Text + "', '" + (String)RadioButtonList4.SelectedValue + "')";

                            SqlCommand cmd1 = new SqlCommand(SqlStr1, objConnection);
                            cmd1.CommandText = SqlStr1;
                            cmd1.ExecuteScalar();

                            String SqlStr2 = "Insert into A_U values('" + TextBox4.Text + "' , '" + TextBox1.Text + "')";
                            SqlCommand cmd2 = new SqlCommand(SqlStr2, objConnection);
                            cmd2.CommandText = SqlStr2;
                            cmd2.ExecuteScalar();

                            Response.Write("<script>alert('注册成功');window.location.href='Administrator.aspx'</script>");
                        }
                    }
                    else
                        Response.Write("<script>alert('长度错误')</script>");
                }
            }
        }
        objConnection.Close();
    }

    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            String S = TextBox2.Text;
            String S1 = TextBox3.Text;

            TextBox2.TextMode = TextBoxMode.SingleLine;
            TextBox3.TextMode = TextBoxMode.SingleLine;

            TextBox2.Text = S;
            TextBox3.Text = S1;
        }
        if (CheckBox1.Checked == false)
        {
            String S = TextBox2.Text;
            String S1 = TextBox3.Text;

            TextBox2.TextMode = TextBoxMode.Password;
            TextBox3.TextMode = TextBoxMode.Password;

            TextBox2.Attributes["value"] = S;
            TextBox3.Attributes["value"] = S1;

        }

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }
}