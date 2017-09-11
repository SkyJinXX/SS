using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_Teacher_release : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    public void GridViewFlush()
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql = "select * from Trelease  where Cid  = '"+(String)Session["Cid"]+"'";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
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
        else
        {
            Label1.Text = (String)Session["username"];
        }

        if (!IsPostBack)
        {
            //刷新GridView
            GridViewFlush();

        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String Sql = "Insert into Trelease Values('" + (String)Session["Cid"] + "','" + TextBox1.Text + "')";
        SqlCommand cmd = new SqlCommand(Sql, objConnection);
        cmd.CommandText = Sql;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('发布公告成功')</script>");
        objConnection.Close();
        TextBox1.Text = "";

        GridViewFlush();

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate.aspx");
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //刷新GridView
        GridViewFlush();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String str2 = GridView1.Rows[row].Cells[0].Text;
        String SqlStr = "delete  from Trelease where  Cid ='" + str2 + "'";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();

        Response.Write("<script>alert('删除成功')</script>");
        objConnection.Close();
        //删除成功之后实时刷新
        GridViewFlush();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
        String Crelease = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox1"))).Text;
        String Cid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String updateSql = "update Trelease set Crelease='"+Crelease+"'";
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

    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_CourseManage.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_SM.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_release.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Testmanage.aspx");
    }


    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_ChapterManage.aspx");
    }
}