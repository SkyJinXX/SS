using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    int count = 0;
    int n = 3;
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
            Label1.Text = (String)Session["username"];
        }
        if(!IsPostBack)
        {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlDataAdapter sda = new SqlDataAdapter();
        string sql = "select Qid,Question  from Questions where Cid='"+(String)Session["Cid"]+"'";
        sda.SelectCommand = new SqlCommand(sql, objConnection);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();
        objConnection.Close();

        }
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        for (int i = 0; i < 3; i++)
        {
            String ql = ((Label)DataList1.Items[i].FindControl("QidLabel")).Text;
            String SqlStr = "Select Qanswer From Questions  where Qid='" + ql + "' and Cid='" + (String)Session["Cid"] + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            String st = (String)cmd.ExecuteScalar();
            RadioButtonList rd = (RadioButtonList)DataList1.Items[i].FindControl("RadioButtonList1");
           // TextBox1.Text = rd.SelectedValue;
             //TextBox2.Text = st;
            if (rd.SelectedValue == st)
            {
                count += 10;
            }
            else
                count += 0;
        }
   
        Response.Write("<script>alert('你的分数为:"+count.ToString()+"');</script>");
        objConnection.Close();
        //Response.Redirect("Study_test.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study.aspx");
    }
}