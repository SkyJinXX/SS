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
    public void FlushGridView()//刷新Gridview函数
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select Student.Sid, Sname, PScore, MScore, FScore, Tscore from S_C_Transcript,Student where Cid = '" +
            (String)Session["Cid"] + "' and S_C_Transcript.Sid = Student.Sid";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "T")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else if ((String)Session["Cid"] == null)
        {
            Response.Write("<script>alert('课程未定');window.location.href='Interface_Teacher_Manage'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        //刷新GridView
        if (!IsPostBack)
        {
            FlushGridView();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //刷新GridView
        FlushGridView();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {        
        String Tscore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox1"))).Text;
        String PScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox2"))).Text;
        String MScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox3"))).Text;
        String FScore = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox4"))).Text;
        String Sid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String updateSql = "update S_C_Transcript set Tscore = " + Tscore + 
            ", PScore = " + PScore + ", MScore = " + MScore + 
            ", FScore = " + FScore + " where Sid = '" + Sid +
            "' and Cid = '" + (String)Session["Cid"] + "'";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(updateSql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        //刷新GridView
        FlushGridView();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //刷新GridView
        FlushGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        String Sid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String deleteSql = "delete from S_C_Transcript where Sid = '" + Sid + "' and Cid = '" +
            (String)Session["Cid"] + "'";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(deleteSql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        //刷新GridView
        FlushGridView();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_SM.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_release.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate1.aspx");
    }


    protected void Button5_Click(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_CourseManage.aspx"); 
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate.aspx");
    }

}