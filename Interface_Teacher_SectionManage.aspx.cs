using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Interface_Teacher_SectionManage : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    public void FlushSection()
    {
        string SelectSql = null;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SelectSql = string.Format("select SSection, ESection, SectionName, FileName, TFileName from Vedio where Cid = '{0}' and ChapterName = '{1}' ORDER BY SSection"
            , (string)Session["Cid"], (string)Session["ChapterName"]);
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columnCount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columnCount;
            GridView1.Rows[0].Cells[0].Text = "暂时没有数据信息";
            GridView1.RowStyle.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
        }
        else
        {
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
        else if ((String)Session["identity"] != "T")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else if ((String)Session["Cid"] == null)
        {
            Response.Write("<script>alert('课程未定');window.location.href='Interface_Teacher_Manage.aspx'</script>");
        }
        else if((string)Session["ChapterName"] == null && (string)Session["Temp_ChapterName"] == null)
        {
            Response.Write("<script>alert('章节未定');window.location.href='Interface_Teacher_ChapterManage.aspx'</script>");
        }
        if (!IsPostBack)
        {
            FlushSection();
        }
    }


    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string ChapterName = (string)Session["Temp_ChapterName"];
        string SChapter = (string)Session["Temp_SChapter"];
        string EChapter = (string)Session["Temp_EChapter"];
        string SectionName = ((TextBox)(GridView1.FooterRow.FindControl("TextBox6"))).Text;
        string SSection = ((TextBox)(GridView1.FooterRow.FindControl("TextBox4"))).Text;
        string ESection = ((TextBox)(GridView1.FooterRow.FindControl("TextBox5"))).Text;
        string FileName = "无文件";
        string URL = "NULL";
        string TURL = "NULL";
        string TFileName = "无文件";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        string sql = string.Format("insert into Vedio values ('{0}', '{1}', {2}, {3}, '{4}', {5}, {6}, '{7}', '{8}', '{9}', '{10}')",
            (string)Session["Cid"], ChapterName, SChapter, EChapter, SectionName, SSection, ESection, URL, FileName, TURL, TFileName);
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        Session["ChapterName"] = ChapterName;
        FlushSection();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Session["SectionName"] = ((Label)(GridView1.Rows[GridView1.EditIndex].Cells[1].FindControl("Label3"))).Text;
        FlushSection();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        FlushSection();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Cid = (string)Session["Cid"];
        string ChapterName = (string)Session["ChapterName"];
        string SectionName = ((Label)(GridView1.Rows[e.RowIndex].FindControl("Label3"))).Text;
        string sql = string.Format("delete from Vedio where Cid = '{0}' and ChapterName = '{1}' and SectionName = '{2}'",
            Cid, ChapterName, SectionName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        FlushSection();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string FormerSectionName = (string)Session["SectionName"];
        string Cid = (string)Session["Cid"];
        string ChapterName = (string)Session["ChapterName"];
        string SSection = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox1"))).Text;
        string ESection = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox2"))).Text;
        string SectionName = ((TextBox)(GridView1.Rows[e.RowIndex].FindControl("TextBox3"))).Text;
        string sql = string.Format("update Vedio set SSection = {0}, ESection = {1}, SectionName ='{2}' where Cid = '{3}' and ChapterName = '{4}' and SectionName = '{5}'"
            , SSection, ESection, SectionName, Cid, ChapterName, FormerSectionName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        FlushSection();
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.location.href='Interface_Teacher_ChapterManage.aspx'</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
        FileUpload fu = (FileUpload)(GridView1.Rows[row].FindControl("FileUpload1"));
        Label lb = (Label)(GridView1.FooterRow.FindControl("Label4"));
        if (fu.HasFile)
        {
            //将文件上传服务器
            string FileName = fu.FileName;
            string URL = Server.MapPath("~/Video/") + FileName;
            fu.SaveAs(URL);

            //将URL更新入数据库
            string Cid = (string)Session["Cid"];
            string ChapterName = (string)Session["ChapterName"];
            string SectionName = ((Label)(GridView1.Rows[row].FindControl("Label3"))).Text;
            string sql = string.Format("update Vedio set URL = '{0}', FileName = '{4}' where Cid = '{1}' and ChapterName = '{2}' and SectionName = '{3}'",
                URL, Cid, ChapterName, SectionName, FileName);
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            SqlCommand cmd = new SqlCommand(sql, objConnection);
            objConnection.Open();
            cmd.ExecuteNonQuery();
            objConnection.Close();
            FlushSection();
            ((Label)(GridView1.FooterRow.FindControl("Label4"))).Text = "上传成功";
        }
        else
        {
            lb.Text = "请先选择文件!";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //先查询当前章节课件的URL
        int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
        string Cid = (string)Session["Cid"];
        string ChapterName = (string)Session["ChapterName"];
        string SectionName = ((Label)(GridView1.Rows[row].FindControl("Label3"))).Text;
        string sql = string.Format("select URL from Vedio where Cid = '{0}' and ChapterName = '{1}' and SectionName = '{2}'"
            , Cid, ChapterName, SectionName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        string URL = (string)cmd.ExecuteScalar();
        objConnection.Close();

        //删除文件，更新数据库
        if (System.IO.File.Exists(URL))
        {
            try
            {
                System.IO.File.Delete(URL);
            }
            catch(Exception error)
            {
                error.ToString();
            }
            sql = string.Format("update Vedio set URL = '{0}', FileName = '{1}' where Cid = '{2}' and ChapterName = '{3}' and SectionName = '{4}'"
                , "NULL", "无文件", Cid, ChapterName, SectionName);
            cmd.CommandText = sql;
            objConnection.Open();
            cmd.ExecuteNonQuery();
            objConnection.Close();
            FlushSection();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
        FileUpload fu = (FileUpload)(GridView1.Rows[row].FindControl("FileUpload2"));
        Label lb = (Label)(GridView1.FooterRow.FindControl("Label7"));
        if (fu.HasFile)
        {
            //将文件上传服务器
            string TFileName = fu.FileName;
            string TURL = Server.MapPath("~/test/") + TFileName;
            fu.SaveAs(TURL);

            //将URL更新入数据库
            string Cid = (string)Session["Cid"];
            string ChapterName = (string)Session["ChapterName"];
            string SectionName = ((Label)(GridView1.Rows[row].FindControl("Label3"))).Text;
            string sql = string.Format("update Vedio set TURL = '{0}', TFileName = '{4}' where Cid = '{1}' and ChapterName = '{2}' and SectionName = '{3}'",
                TURL, Cid, ChapterName, SectionName, TFileName);
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            SqlCommand cmd = new SqlCommand(sql, objConnection);
            objConnection.Open();
            cmd.ExecuteNonQuery();
            objConnection.Close();
            FlushSection();
            ((Label)(GridView1.FooterRow.FindControl("Label7"))).Text = "上传成功";
        }
        else
        {
            lb.Text = "请先选择文件!";
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        //先查询当前章节课件的URL
        int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
        string Cid = (string)Session["Cid"];
        string ChapterName = (string)Session["ChapterName"];
        string SectionName = ((Label)(GridView1.Rows[row].FindControl("Label3"))).Text;
        string sql = string.Format("select TURL from Vedio where Cid = '{0}' and ChapterName = '{1}' and SectionName = '{2}'"
            , Cid, ChapterName, SectionName);
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        string TURL = (string)cmd.ExecuteScalar();
        objConnection.Close();

        //删除文件，更新数据库
        if (System.IO.File.Exists(TURL))
        {
            try
            {
                System.IO.File.Delete(TURL);
            }
            catch (Exception error)
            {
                error.ToString();
            }
            sql = string.Format("update Vedio set TURL = '{0}', TFileName = '{1}' where Cid = '{2}' and ChapterName = '{3}' and SectionName = '{4}'"
                , "NULL", "无文件", Cid, ChapterName, SectionName);
            cmd.CommandText = sql;
            objConnection.Open();
            cmd.ExecuteNonQuery();
            objConnection.Close();
            FlushSection();
        }
    }
}