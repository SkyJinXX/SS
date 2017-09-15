using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Interface_Student_Menu : System.Web.UI.Page
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
            Label1.Text = (String)Session["name"];
        }

        if (!IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "select Cname , Crelease from S_C_Transcript,Trelease,Course where S_C_Transcript.Cid = Trelease.Cid and S_C_Transcript.Cid = Course.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            String SelectSql1 = "select Aname, A_S_Annou from A_S_Announcement where Sid in (Select Sid from S_U where"
                + " Uusername = '" + (String)Session["username"] + "')  and Sname = '" + Session["name"] + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(SelectSql1, objConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            GridView2.DataSource = ds1;
            GridView2.DataBind();

            objConnection.Close();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Menu.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Select.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Change.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Session["name"] = null;
        Response.Redirect("Default.aspx");
    }
}