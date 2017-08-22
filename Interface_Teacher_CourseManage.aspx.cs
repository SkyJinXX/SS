using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Interface_Teacher_CourseManage : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
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
        
        if (!IsPostBack)
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            string sql = "";
            SqlCommand cmd = new SqlCommand(sql, objConnection);
            cmd.CommandText = "select * from Course where Cid = '" + Session["Cid"] + "'";
            objConnection.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            try
            {
                sdr.Read();
                TextBox1.Text = (string)sdr[0];
                TextBox2.Text = (string)sdr[1];
                TextBox3.Text = sdr[2].ToString();
                TextBox4.Text = sdr[3].ToString();
                DropDownList1.SelectedValue = (string)sdr[4];
                TextBox6.Text = (string)sdr[5];
                sdr.Close();
                objConnection.Close();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('出错啦')</script>");
            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

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
        Response.Redirect("Interface_Teacher_Testmanage.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

    }


    protected void Button7_Click(object sender, EventArgs e)
    {
        string Cname = TextBox2.Text;
        string Ccredit = TextBox3.Text;
        string Cpersonnumber = TextBox4.Text;
        string Ccategory = DropDownList1.SelectedValue;
        string Cintroduction = TextBox6.Text;
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        string sql = string.Format("update Course set Cname = '{0}', Ccredit = {1}, Cpersonnumber = {2}, Ccategory = '{3}', Cintroduction = '{4}' where Cid = '{5}'"
            , Cname, Ccredit, Cpersonnumber, Ccategory, Cintroduction, (string)Session["Cid"]);
        SqlCommand cmd = new SqlCommand(sql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
    }
}