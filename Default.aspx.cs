using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Huiye;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            objConnection.Open();

            if (Check.CheckLength(TextBox1.Text.Length, 10) && Check.CheckLength(TextBox2.Text.Length, 16))
            {
                String SqlStr = "Select Upassword From Users where Uusername = '" + TextBox1.Text +
                    "' and Uidentity = '" + RadioButtonList1.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(SqlStr, objConnection);

                String st = TextBox2.Text;
                int l1 = st.Length;
                String st1 = (String)cmd.ExecuteScalar();
                int l2 = st1.Length;

                for (int i = 0; i < l2 - l1; i++)
                    st += ' ';

                if (st == st1)
                {
                    Session["username"] = TextBox1.Text;
                    Session["identity"] = RadioButtonList1.SelectedValue;
                    if ((String)Session["identity"] == "T")
                    {
                        Response.Write("<script>alert('登陆成功');window.location.href='Interface_Teacher.aspx'</script>");
                        cmd.CommandText = "select Tname from Teacher where Tid = (select Tid from T_U where Uusername = '" +
                            TextBox1.Text + "')";
                        Session["name"] = cmd.ExecuteScalar().ToString();
                    }
                    else if ((String)Session["identity"] == "S")
                    {
                        Response.Write("<script>alert('登陆成功');window.location.href='Interface_Student_Announcement.aspx'</script>");
                        cmd.CommandText = "select Sname from Student where Sid = (select Sid from S_U where Uusername = '" +
                            TextBox1.Text + "')";
                        Session["name"] = cmd.ExecuteScalar().ToString();
                    }
                    else if ((String)Session["identity"] == "A")
                    {
                        Response.Write("<script>alert('登陆成功');window.location.href='Administrator.aspx'</script>");
                        cmd.CommandText = "select Aname from Administrator where Aid = (select Aid from A_U where Uusername = '" +
                            TextBox1.Text + "')";
                        Session["name"] = cmd.ExecuteScalar().ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('身份错误');window.location.href='Default.aspx'</script>");
                    }
                }

                else
                    Response.Write("<script>alert('密码错误');</script>");
                objConnection.Close();
            }
            else
                Response.Write("<script>alert('长度错误')</script>");
            objConnection.Close();


        }
        catch
        {
            Response.Write("<script>alert('登录失败');</script>");
        }
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void Change_Click(object sender, EventArgs e)
    {
        Response.Redirect("Change.aspx");
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}