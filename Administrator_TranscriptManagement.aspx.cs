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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Label4.Text = TextBox1.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        if (TextBox1.Text != "")
        {
            //通过文本框查询 选择该课程的学生详细信息形成表单
            String Sql = "select * from Course";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script>alert('请输入课程名')</script>");
            
        }
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }
}