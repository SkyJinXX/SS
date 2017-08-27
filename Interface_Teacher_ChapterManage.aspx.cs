using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Interface_Teacher_ChapterManage : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    public void FlushChapter()
    {
        string SelectSql = null;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SelectSql = string.Format("select distinct SChapter, EChapter, ChapterName from Vedio where Cid = '{0}'ORDER BY SChapter", (string)Session["Cid"]);
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
        if (!IsPostBack)
        {
            FlushChapter();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["ChapterName"] = ((Label)(GridView1.Rows[row].Cells[1].FindControl("Label3"))).Text;
        Session["Temp_ChapterName"] = ((Label)(GridView1.Rows[row].Cells[1].FindControl("Label3"))).Text;
        Session["Temp_SChapter"] = ((Label)(GridView1.Rows[row].Cells[1].FindControl("Label1"))).Text;
        Session["Temp_EChapter"] = ((Label)(GridView1.Rows[row].Cells[1].FindControl("Label2"))).Text;
        Response.Redirect("Interface_Teacher_SectionManage.aspx");
    }

    protected void LinkButton2_Click2(object sender, EventArgs e)
    {
        Session["ChapterName"] = null;
        Session["Temp_ChapterName"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox6"))).Text;
        Session["Temp_SChapter"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox4"))).Text;
        Session["Temp_EChapter"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox5"))).Text;
        Response.Redirect("Interface_Teacher_SectionManage.aspx");
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Session["ChapterName"] = ((Label)(GridView1.Rows[GridView1.EditIndex].Cells[1].FindControl("Label3"))).Text;
        FlushChapter();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string FormerChapterName = (string)Session["ChapterName"];
        string Cid = (string)Session["Cid"];
        string ChapterName = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox3"))).Text;
        string SChapter = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox1"))).Text;
        string EChapter = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox2"))).Text;
        string sql = string.Format("update Vedio set ChapterName = '{0}', SChapter = {1}, EChapter = {2} where Cid = '{3}' and ChapterName = '{4}'"
            ,ChapterName, SChapter, EChapter, Cid, FormerChapterName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        FlushChapter();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ChapterName = ((Label)(GridView1.Rows[e.RowIndex].Cells[1].FindControl("Label3"))).Text;
        string Cid = (string)Session["Cid"];
        string sql = string.Format("delete from Vedio where Cid = '{0}' and ChapterName = '{1}'"
            , Cid, ChapterName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        FlushChapter();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        FlushChapter();
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session["ChapterName"] = null;
        Session["Temp_ChapterName"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox6"))).Text;
        Session["Temp_SChapter"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox4"))).Text;
        Session["Temp_EChapter"] = ((TextBox)(GridView1.FooterRow.FindControl("TextBox5"))).Text;
        Response.Redirect("Interface_Teacher_SectionManage.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_CourseManage.aspx");
    }
}