using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
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
        //显示可选课程
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select * from Course";
        SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();
        //显示已选课程
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Select.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Change.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        if(TextBox1.Text != "")
        {
            //若文本框不为空，查询相关课程
            String Sql = "select * from Course where Cname = '" + TextBox1.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();            
        }
        else{
            //若文本框为空 或 课程名与数据库中课程名不匹配，则显示全部课程
            String Sql = "select * from Course";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();            
        }
        objConnection.Close();
    }



    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        String str1 = GridView1.Rows[row].Cells[0].Text;
        String str2 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
        objConnection.Open();
        //验证课程是否重复选择
        String SqlStr = "Select Sid,Cid From S_C_Transcript Where Cid = '"+ str1 + "' and Sid IN(select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        if (cmd.ExecuteScalar() != null)
            Response.Write("<script>alert('课程已选择，请勿重复选择')</script>");
        //将用户选择课程数据插入到数据库表中
        else {
            SqlStr = "Insert into S_C_Transcript select Sid, '" + str1 +"', '' from S_U where Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
            cmd = new SqlCommand(SqlStr, objConnection);
            cmd.CommandText = SqlStr;
            cmd.ExecuteScalar();
            Response.Write("<script>alert('选课成功')</script>");
            //选课成功之后实时刷新
            String SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        
        
    }



    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        String str1 = GridView2.Rows[row].Cells[0].Text;
        String str2 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
        objConnection.Open();
        String SqlStr = "Delete S_C_Transcript where Cid = '" + str1 + "' and Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('退选成功')</script>");
        //退选成功之后实时刷新
        String SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study.aspx");
    }
}