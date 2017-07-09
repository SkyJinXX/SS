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
        if(Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");                       
        }
        else if((String)Session["identity"] != "T")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select * from Tmessage";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button_Change_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button_Create_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Rank.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }
}