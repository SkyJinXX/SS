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

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "select * from Users";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_RightsManagement.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_Register.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_UsersManagement.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_CourseManagement.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_TranscriptManagement.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_individual.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Label3.Text = "1";
        GridView1.Visible = false;
        GridView2.Visible = true;
        GridView3.Visible = false;
        GridView4.Visible = false;
        objConnection.Open();
        String SelectSql = "select Student.Sid , Sname , Ssex , Sbirthday ,Sage , Sschool , Scollege , Smajor, Sphone, Users.Uusername, Upassword , Uidentity" +
            " from Student , Users ,S_U where  Users.Uidentity = 'S' and Student.Sid = S_U.Sid and S_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        objConnection.Close();
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Label3.Text = "2";
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = true;
        GridView4.Visible = false;
        objConnection.Open();
        String SelectSql = "select Teacher.Tid, Tname, Tsex, Tbirthday, Tprofession, Tphone,  Users.Uusername, Upassword , Uidentity  from Teacher, " +
            "Users, T_U where  Users.Uidentity = 'T' and Teacher.Tid = T_U.Tid and T_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView3.DataSource = ds;
        GridView3.DataBind();
        objConnection.Close();
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Label3.Text = "3";
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = true;
        objConnection.Open();
        String SelectSql = "select Administrator.Aid, Aname, Asex, Abirthday, Aage, Alevel, Users.Uusername, Upassword , Uidentity from Administrator ," +
            " Users , A_U where  Users.Uidentity = 'A' and Administrator.Aid = A_U.Aid and A_U.Uusername = Users.Uusername";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView4.DataSource = ds;
        GridView4.DataBind();
        objConnection.Close();
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        String Select1 = "";
        if (Label3.Text == "1")
        {
            Select1 = "select Student.Sid , Sname , Ssex , Sbirthday ,Sage , Sschool , Scollege , Smajor, Sphone, Users.Uusername, Upassword , Uidentity" +
            " from Student , Users ,S_U where  Users.Uidentity = 'S' and Student.Sid = S_U.Sid and S_U.Uusername = Users.Uusername and S_U.Sid = '" + TextBox1.Text + "'";
        }

        if (Label3.Text == "2")
        {
            Select1 = "select Teacher.Tid, Tname, Tsex, Tbirthday, Tprofession, Tphone,  Users.Uusername, Upassword , Uidentity  from Teacher, " +
            "Users, T_U where  Users.Uidentity = 'T' and Teacher.Tid = T_U.Tid and T_U.Uusername = Users.Uusername and T_U.Tid = '" + TextBox1.Text + "'";
        }

        if (Label3.Text == "3")
        {
            Select1 = "select Administrator.Aid, Aname, Asex, Abirthday, Aage, Alevel, Users.Uusername, Upassword , Uidentity from Administrator ," +
            " Users , A_U where  Users.Uidentity = 'A' and Administrator.Aid = A_U.Aid and A_U.Uusername = Users.Uusername and A_U.Aid = '" +
                TextBox1.Text + "'";
        }

        if (Select1 != "")
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;

            SqlDataAdapter da = new SqlDataAdapter(Select1, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (Label3.Text == "1")
            {
                GridView2.Visible = true;
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
            if (Label3.Text == "2")
            {
                GridView3.Visible = true;
                GridView3.DataSource = ds;
                GridView3.DataBind();
            }
            if (Label3.Text == "3")
            {
                GridView4.Visible = true;
                GridView4.DataSource = ds;
                GridView4.DataBind();
            }
            objConnection.Close();
        }
    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        String Select1 = "";
        if (Label3.Text == "1")
        {
            Select1 = "update Users set Upassword = '" + "666666" + "' where Uidentity = '" + "S" + "' and Uusername in (select Uusername from S_U where Sid = '"
                + TextBox1.Text + "')";
        }

        if (Label3.Text == "2")
        {
            Select1 = "update Users set Upassword = '" + "666666" + "' where Uidentity = '" + "T" + "' and Uusername in (select Uusername from T_U where Tid = '"
                + TextBox1.Text + "')";
        }

        if (Label3.Text == "3")
        {
            Select1 = "update Users set Upassword = '" + "666666" + "' where Uidentity = '" + "A" + "' and Uusername in (select Uusername from A_U where Aid = '"
                + TextBox1.Text + "')";
        }
        SqlCommand cmd = new SqlCommand(Select1, objConnection);
        cmd.ExecuteScalar();
        objConnection.Close();
    }




    protected void Button13_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }
}