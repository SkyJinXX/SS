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
    String cname = "";
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
            Label1.Text = (string)Session["username"];
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql1 = "select Cid from Course where Cname = '" + TextBox1.Text + "'";
        //判断输入文本框是否为空
        if (TextBox1.Text != "")
        {
            String Isexist = "select Cname from Course where Cname = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(Isexist, objConnection);
            //查询文本框中输入课程名是否存在
            if (cmd.ExecuteScalar() == null)
            {
                Response.Write("<script>alert('未开设此课程')</script>");
            }
            //通过文本框查询 课程存在 选择该课程的学生详细信息形成表单
            else {
                Label4.Text = TextBox1.Text;
                String Sql = "select Student.Sid,Sname,Scollege,Smajor,Sclass,Tscore from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
                SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            
        }
        else
        {
            Response.Write("<script>alert('请输入课程名')</script>");
            
        }
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
        String str1 = GridView1.Rows[row].Cells[0].Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String str2 = "select Cid from Course where Cname = '" + TextBox1.Text + "'";
        String SqlStr = "Delete S_C_Transcript where Sid IN(" + str1 + ") and Cid IN(" + str2 + ")";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        /*SqlStr = "Delete T_C,S_C_Transcript where Sid = '" + str1 + "' and T_C.Cid = S_C_Transscript.Cid";
        cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        SqlStr = "Delete Course,S_C_Transcript where Sid = '" + str1 + "' and T_C.Cid = S_C_Transscript.Cid";
        cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();*/
        Response.Write("<script>alert('删除成功')</script>");
        objConnection.Close();
        //删除成功之后实时刷新
        cname = TextBox1.Text;
        Label4.Text = TextBox1.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql1 = "select Cid from Course where Cname = '" + cname + "'";
        String Sql = "select Student.Sid,Sname,Scollege,Smajor,Sclass,Tscore from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //刷新GridView
        cname = TextBox1.Text;
        Label4.Text = TextBox1.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql1 = "select Cid from Course where Cname = '" + cname + "'";
        String Sql = "select Student.Sid,Sname,Scollege,Smajor,Sclass,Tscore from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String Sid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String Tscore = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[1])).Text;
        String updateSql = "update S_C_Transcript set Tscore = '" + Tscore + "' where Sid = '" + Sid + "'";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(updateSql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        //刷新GridView
        cname = TextBox1.Text;
        Label4.Text = TextBox1.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql1 = "select Cid from Course where Cname = '" + cname + "'";
        String Sql = "select Student.Sid,Sname,Scollege,Smajor,Sclass,Tscore from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //刷新GridView
        cname = TextBox1.Text;
        Label4.Text = TextBox1.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql1 = "select Cid from Course where Cname = '" + cname + "'";
        String Sql = "select Student.Sid,Sname,Scollege,Smajor,Sclass,Tscore from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}