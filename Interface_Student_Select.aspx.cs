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
        SqlConnection objConnection = new SqlConnection();
        String Sql1 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
        String Sql2 = "select Cid from Course where Cname = '" + TextBox1.Text + "'";
        //查询全部课程的成绩
        //刷新GridView
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        //条件中通过表的连接来确保数据显示无误
        String Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore from Course," +
                        "S_C_Transcript,Student where S_C_Transcript.Sid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection();
        String Sql1 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
        String Sql2 = "select Cid from Course where Cname = '" + TextBox1.Text + "'";
        if (TextBox1.Text != "")
        {
            //查询指定课程成绩
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            //条件中通过表的连接来确保数据显示无误
            String Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore from Course," +
                "S_C_Transcript,Student where S_C_Transcript.Cid IN(" + Sql2 + ") and S_C_Transcript.Sid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            objConnection.Close();
        }
        else
        {
            //查询全部课程的成绩
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            //条件中通过表的连接来确保数据显示无误
            String Sql = "select Course.Cid, Cname, Ccredit, Ccategory, PScore, MScore, FScore, Tscore from Course," +
                            "S_C_Transcript,Student where S_C_Transcript.Sid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

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