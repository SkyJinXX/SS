using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Huiye;

public partial class Study_discuss : System.Web.UI.Page
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
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String SelectSql = "select * from Umessage where Cid='"+(String)Session["Cid"]+"'";
            SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql = "select * from Ureply where Cid='" + (String)Session["Cid"] + "'";
        SqlDataAdapter da2 = new SqlDataAdapter(Sql, objConnection);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        GridView2.DataSource = ds2;
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_notice.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study1.aspx");

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_test.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_exam.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_discuss.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        objConnection.Open();
        if (Check.CheckLength(TextBox1.Text.Length, 30)){
            String Sqlstr = "Insert into Umessage values('"+(String)Session["Cid"]+"','" + (string)Session["username"] + "','" + TextBox1.Text + "')";
            SqlCommand cmd = new SqlCommand(Sqlstr, objConnection);
            cmd.CommandText = Sqlstr;
            cmd.ExecuteScalar();
            Response.Write("<script>alert('发言成功')</script>");

            TextBox1.Text = "";
            //objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String SelectSql = "select * from Umessage where Cid = '" + (String)Session["Cid"] + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            GridView1.DataSource = ds1;
            GridView1.DataBind();
        }
        else
            Response.Write("<script>alert('长度错误')</script>");
        objConnection.Close();
    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["reply"] = GridView1.Rows[row].Cells[0].Text;
        Response.Redirect("Study_reply.aspx");
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row1 = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["reply1"] = GridView2.Rows[row1].Cells[0].Text;
        Response.Redirect("Study_reply1.aspx");
    }
}