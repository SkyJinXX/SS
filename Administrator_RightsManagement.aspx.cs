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
            Label3.Visible = false;
            TextBox3.Visible = false;
            Button4.Visible = false;
            Label2.Visible = false;
            TextBox1.Visible = false;
            Button1.Visible = false;
        }

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "select * from Administrator";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label2.Visible = true;
        TextBox1.Visible = true;
        Button1.Visible = true;
        Label3.Visible = true;
        TextBox3.Visible = true;
        Button4.Visible = true;

        objConnection.Open();

        String TB1 = TextBox1.Text;
        String SelectSql = "select Alevel from Administrator where Aid = '" + TB1 + "'";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        if (Button4.Text == "修改")
        {
            if ((String)cmd.ExecuteScalar() == null)
            {
                Response.Write("<script>alert('请输入正确管理员工号');</script>");
            }

            else
            {
                TextBox3.Text = (String)cmd.ExecuteScalar();
            }
        }
        else
            TextBox3.Text = "";
       objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Label2.Visible = true;
        TextBox1.Visible = true;
        Button1.Visible = true;
        Label3.Visible = true;
        TextBox3.Visible = true;
        Button4.Visible = true;

        objConnection.Open();

        String a = "select Aname from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd1 = new SqlCommand(a, objConnection);
        String b = "select Aname from Administrator where Aid = '" + TextBox1.Text + "'";
        SqlCommand cmd2 = new SqlCommand(b, objConnection);

        if (Button4.Text == "修改")
        {
            int levea = Convert.ToInt32((String)TextBox3.Text);
            String selectlevel = "select Alevel from Administrator where Aid = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(selectlevel, objConnection);
            int levelb = Convert.ToInt32((String)cmd.ExecuteScalar());

            if (levea != levelb)
            {
                String SelectSql = "";
                cmd = new SqlCommand(SelectSql, objConnection);
                cmd.CommandText = "update Administrator set Alevel = '" + TextBox3.Text
                    + "' where Aid = '" + TextBox1.Text + "'";
                cmd.ExecuteScalar();

                cmd = new SqlCommand(SelectSql, objConnection);
                String action = (String)cmd1.ExecuteScalar() + " let  the level of " + (String)cmd2.ExecuteScalar();
                if (levea > levelb)
                {
                    action += " be up ";
                }
                else
                {
                    action += " be down ";
                }
                action += "and the level become " + Convert.ToString(levea) +" .";
                cmd.CommandText = "insert into A_A_Management values( '" + (String)cmd1.ExecuteScalar() + "','" + (String)cmd2.ExecuteScalar()
                        + "','" + "" + "','" + (String)action + "')";
                cmd.ExecuteScalar();

                String SelectSql1 = "select * from Administrator";
                SqlDataAdapter da = new SqlDataAdapter(SelectSql1, objConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                Response.Write("<script>alert('修改成功')</script>");
            }
        }
        if (Button4.Text == "发送")
        {
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
            cmd.CommandText = "insert into A_A_Management values( '" + (String)cmd1.ExecuteScalar() + "','" + (String)cmd2.ExecuteScalar() + "','" + TextBox3.Text + "','" + "" + "')";
            cmd.ExecuteScalar();

            Response.Write("<script>alert('发送成功')</script>");
        }

        objConnection.Close();

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Label2.Visible = true;
        TextBox1.Visible = true;
        Button1.Visible = true;
        Label3.Visible = true;
        TextBox3.Visible = true;
        Button4.Visible = true;

        Label3.Text = "权限：";
        TextBox3.Width  = 150;
        TextBox3.Height = 20;
        Button4.Text = "修改";
    }

    protected void Button6_Click(object sender, EventArgs e)
    {

        Label2.Visible = true;
        TextBox1.Visible = true;
        Button1.Visible = true;
        Label3.Visible = true;
        TextBox3.Visible = true;
        Button4.Visible = true;
        TextBox3.Width = 300;
        TextBox3.Height = 100;
        Label3.Text = "留言：";
        Button4.Text = "发送";

    }

}


/*String c = "select Alevel from A_A_Management where Aname1 = '" + (String)cmd1.ExecuteScalar()+ "'and Aname2 = '" + (String)cmd1.ExecuteScalar() + "'";
SqlCommand cmd3 = new SqlCommand(c, objConnection);
String d = "select Aname1 from A_A_Management where Aname1 = '" + (String)cmd1.ExecuteScalar() + "'and Aname2 = '" + (String)cmd1.ExecuteScalar() + "'";
SqlCommand cmd4 = new SqlCommand(d, objConnection);
if ((String)cmd.ExecuteScalar() == null)
{
    cmd.CommandText = "update A_A_Management set Alevel = '" + TextBox3.Text + "' where Aname1 = '" + (String)cmd1.ExecuteScalar()
        + "'and Aname2 = '" + (String)cmd1.ExecuteScalar() + "'";
}
*/
