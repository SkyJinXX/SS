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

    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox1.Text.Length, 10) && Check.CheckLength(TextBox2.Text.Length, 10))
        {
            String SqlStr = "Select Password from Users Where Users = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            String st = TextBox2.Text;
            int l1 = st.Length;
            String st1 = (String)cmd.ExecuteScalar();
            int l2 = st1.Length;

            if (l1 > l2)
                Response.Write("<script>alert('密码错误')</script>");
            else
            {
                for (int i = 0; i < l2 - l1; i++)
                    st += ' ';
            }
            if (st == st1)
            {
                SqlStr = "Update Users set Password = '" + TextBox3.Text + "' Where Users = '" + TextBox1.Text + "'";
                cmd.CommandText = SqlStr;
                cmd.ExecuteScalar();
                Response.Write("<script>alert('修改成功')</script>");
            }
            else
                Response.Write("<script>alert('修改该失败')</script>");
        }
        else
            Response.Write("<script>alert('长度错误')</script>");
    }
}