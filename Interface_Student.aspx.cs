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
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select * from S_C";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SelectSql = "select * from Course";
        SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

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

    }



    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}