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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection();
        if (TextBox1.Text != "")
        {
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String Sql = "select * from Course where Cname = '" + TextBox1.Text + "' and Cid IN (Select Cid from S_C_Transcript where Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "'))";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }else {
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String Sql = "select * from Course where Cid IN (Select Cid from S_C_Transcript where Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "'))";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }
}