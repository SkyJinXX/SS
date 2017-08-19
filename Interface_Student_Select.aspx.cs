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

    public void GridViewFlush()
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql = GridViewFlush_Condition();
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }

    protected String GridViewFlush_Condition()
    {
        String Sql = "";
        if (TextBox2.Text == "")
        {
            if (TextBox1.Text == "")
            {
                if (DropDownList1.SelectedValue == "")
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                        "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Student.Sid = ("+"select Sid from S_U where Uusername = '" + 
                         (String)Session["username"] + "')";
                }
                else
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                          + "= Course.Cid and Ccategory = '" + DropDownList1.SelectedValue + "'and Student.Sid = (" + 
                          "select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
                }
            }
            else
            {
                if (DropDownList1.SelectedValue == "")
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                          + "= Course.Cid and Cname = '" + TextBox1.Text + "'and Student.Sid = (" + "select Sid from S_U " +
                          "where Uusername = '" + (String)Session["username"] + "')";
                }
                else
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Cname = '" + TextBox1.Text + "'and Ccategory = '" + DropDownList1.SelectedValue
                         + "'and Student.Sid = (" + "select Sid from S_U where Uusername = '" + (String)Session["username"] 
                         + "')";

                }
            }
        }
        else
        {
            if (TextBox1.Text == "")
            {
                if (DropDownList1.SelectedValue == "")
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Course.Cid = '" + TextBox2.Text + "'and Student.Sid = (" + "select Sid " +
                         "from S_U where Uusername = '" + (String)Session["username"] + "')";
                }
                else
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Course.Cid = '" + TextBox2.Text + "'and Ccategory = '" + DropDownList1.SelectedValue
                         + "'and Student.Sid = (" + "select Sid from S_U where Uusername = '" +(String)Session["username"] 
                         + "')";
                }
            }
            else
            {
                if (DropDownList1.SelectedValue == "")
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Course.Cid = '" + TextBox2.Text + "'and Cname = '" + TextBox1.Text +
                         "'and Student.Sid = (" + "select Sid from S_U where Uusername = '" + (String)Session["username"] 
                         + "')";
                }
                else
                {
                    Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                         "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Course.Cid = '" + TextBox2.Text + "'and Cname = '" + TextBox1.Text +
                         "'and Ccategory = '" + DropDownList1.SelectedValue + "'and Student.Sid = (" + "select Sid " +
                         "from S_U where Uusername = '" + (String)Session["username"] + "')";
                }
            }
        }
        return Sql;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "S")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label2.Text = (String)Session["username"];
        }

        //查询全部课程的成绩
        //刷新GridView

        //条件中通过表的连接来确保数据显示无误
        GridViewFlush();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        String SelectSql = GridViewFlush_Condition();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        cmd.CommandText = SelectSql;

        if ((String)cmd.ExecuteScalar() == null)
        {
            Response.Write("<script>alert('未找到该课程的成绩，未选该课程')</script>");
            SelectSql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore " +
                        "from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid "
                         + "= Course.Cid and Student.Sid = (" + "select Sid from S_U where Uusername = '" +
                         (String)Session["username"] + "')";

        }
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }


    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}