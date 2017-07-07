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
    int flag;
    protected void Page_Load(object sender, EventArgs e)
    {
        flag = 0;
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

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "select * from Users";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        flag = 1;
        objConnection.Open();
        String SelectSql = "select Student.Sid , Sname , Ssex , Sbirthday ,Sage , Sschool , Scollege , Smajor, Sphone, Users.Uusername, Upassword , Uidentity" +
            " from Student , Users ,S_U where  Users.Uidentity = 'S' and Student.Sid = S_U.Sid and S_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        flag = 2;
        objConnection.Open();
        String SelectSql = "select Teacher.Tid, Tname, Tsex, Tbirthday, Tprofession, Tphone,  Users.Uusername, Upassword , Uidentity  from Teacher, " +
            "Users, T_U where  Users.Uidentity = 'T' and Teacher.Tid = T_U.Tid and T_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        flag = 3;
        objConnection.Open();
        String SelectSql = "select Administrator.Aid, Aname, Asex, Abirthday, Aage, Alevel, Users.Uusername, Upassword , Uidentity from Administrator ," +
            " Users , A_U where  Users.Uidentity = 'A' and Administrator.Aid = A_U.Aid and A_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }


    protected void Button5_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        String Select1 = "";
        TextBox1.Text = Convert.ToString(flag);
        if (flag == 1)
        {
            Select1 = "select Student.Sid , Sname , Ssex , Sbirthday ,Sage , Sschool , Scollege , Smajor, Sphone, Users.Uusername, Upassword , Uidentity" +
            " from Student , Users ,S_U where  Users.Uidentity = 'S' and Student.Sid = S_U.Sid and S_U.Uusername = Users.Uusername";
        }

        if (flag == 2)
        {
            Select1 = "select Teacher.Tid, Tname, Tsex, Tbirthday, Tprofession, Tphone,  Users.Uusername, Upassword , Uidentity  from Teacher, " +
            "Users, T_U where  Users.Uidentity = 'T' and Teacher.Tid = T_U.Tid and T_U.Uusername = Users.Uusername and T_U.Tid = '" + TextBox1.Text + "'";
        }

        if (flag == 3)
        {
            Select1 = "select Administrator.Aid, Aname, Asex, Abirthday, Aage, Alevel, Users.Uusername, Upassword , Uidentity from Administrator ," +
            " Users , A_U where  Users.Uidentity = 'A' and Administrator.Aid = A_U.Aid and A_U.Uusername = Users.Uusername A_U.Sid = '" +
                TextBox1.Text + "'";
        }
        if (Select1 != "")
        {
            SqlDataAdapter da = new SqlDataAdapter(Select1, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            objConnection.Close();
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        String Select1 = "";
        if (flag == 1)
        {
            Select1 = "updata Users set Upassword = '" + "666666" + "' where Uidentity = '" + "S" + "' and Uusername in (select Uusername from S_U where Sid = '"
                + TextBox1.Text + "')";
        }

        if (flag == 2)
        {
            Select1 = "updata Users set Upassword = '" + "666666" + "' where Uidentity = '" + "T" + "' and Uusername in (select Uusername from T_U where Tid = '"
                + TextBox1.Text + "')";
        }

        if (flag == 3)
        {
            Select1 = "updata Users set Upassword = '" + "666666" + "' where Uidentity = '" + "A" + "' and Uusername in (select Uusername from A_U where Aid = '"
                + TextBox1.Text + "')";
        }
    }
}