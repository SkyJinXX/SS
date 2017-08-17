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
    public void GridViewFlush()
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        if(TextBox1.Text != "")
        {
            cname = TextBox1.Text;
            String Sql1 = "select Cid from Course where Cname = '" + cname + "'";
            String Sql = "select Student.Sid,Sname,Pscore,Mscore,Fscore,Tscore,Course.Cid,Cname from Student,S_C_Transcript,Course where Course.Cid IN(" + Sql1 + ") and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            String Sql = "select Student.Sid,Sname,Pscore,Mscore,Fscore,Tscore,Course.Cid,Cname from Student,S_C_Transcript,Course where  S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();            
        }
    }
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
        if (!IsPostBack)
        {
            GridViewFlush();
        }
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String a = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd1 = new SqlCommand(a, objConnection);
        int b = Convert.ToInt32(cmd1.ExecuteScalar());
        objConnection.Close();
        if (b < 2)
        {
            Button2.Enabled = false;
        }
        if (b < 3)
        {
            Button3.Enabled = false;
        }
        if (b < 4)
        {
            Button4.Enabled = false;
        }
        if (b < 5)
        {
            Button5.Enabled = false;
        }

        
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

    protected void Button8_Click1(object sender, EventArgs e)
    {
        
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql1 = "select Cid from Course where Cname = '" + TextBox1.Text + "'";
        //判断输入文本框是否为空
        if (TextBox1.Text != "")
        {
            String Isexist = "select Cname from Course where Cname = '" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(Isexist, objConnection);
            cmd.CommandText = Isexist;
            String Isexist1 = "select Cid from Course where Cid = '" + TextBox1.Text + "'";
            SqlCommand cmd1 = new SqlCommand(Isexist, objConnection);
            cmd1.CommandText = Isexist1;

            if(cmd1.ExecuteScalar() != null)
            {
                String Sql = "select Student.Sid,Sname,Pscore,Mscore,Fscore,Tscore,Course.Cid,Cname from Student,S_C_Transcript,Course where Course.Cid = '" + TextBox1.Text + "' and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
                SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            else if (cmd.ExecuteScalar() != null)
            {
                String Sql = "select Student.Sid,Sname,Pscore,Mscore,Fscore,Tscore,Course.Cid,Cname from Student,S_C_Transcript,Course where Course.Cname = '" + TextBox1.Text + "' and S_C_Transcript.Sid = Student.Sid and S_C_Transcript.Cid = Course.Cid";
                SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            else 
            {
                Response.Write("<script>alert('未开设此课程')</script>");
            }

        }
        else
        {
            Response.Write("<script>alert('请输入课程名')</script>");
            
        }
        objConnection.Close();
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
        String str1 = GridView1.Rows[row].Cells[2].Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String str2 = GridView1.Rows[row].Cells[0].Text;
        String SqlStr = "Delete S_C_Transcript where Sid ='" + str1 + "' and Cid ='" + str2 + "'";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        
        Response.Write("<script>alert('删除成功')</script>");
        objConnection.Close();
        //删除成功之后实时刷新
        GridViewFlush();
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //刷新GridView
        GridViewFlush();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String Sid = GridView1.Rows[e.RowIndex].Cells[2].Text;
        String Cid = GridView1.Rows[e.RowIndex].Cells[0].Text;     
        String Tscore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox1"))).Text;
        String PScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox4"))).Text;
        String MScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox3"))).Text;
        String FScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox2"))).Text;
        
        String updateSql = "update S_C_Transcript set Tscore = " + Tscore + 
            " , PScore = " + PScore + " , MScore = " + MScore + " , FScore = " + FScore + " where Sid = '" + Sid + "' and Cid = '" + Cid + "'";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(updateSql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        //刷新GridView
        GridViewFlush();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //刷新GridView
        GridViewFlush();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}