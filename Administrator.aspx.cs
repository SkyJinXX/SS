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
            Label1.Text = (string)Session["username"];
        }
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select * from A_Message where Aname1 = '" + (String)Session["username"] + "'" + " or Aname2 = '" + (String)Session["username"] + "'";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
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

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_TranscriptManagement.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_CourseManagement.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}