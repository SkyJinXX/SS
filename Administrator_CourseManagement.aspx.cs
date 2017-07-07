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
        String SelectSql = "select * from Course ";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        String str1 = GridView1.Rows[row].Cells[0].Text;
        objConnection.Open();
        String SqlStr = "Delete S_C_Transcript where Cid = '" + str1 + "'";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        SqlStr = "Delete T_C where Cid = '" + str1 + "'";
        cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        SqlStr = "Delete Course where Cid = '" + str1 + "'";
        cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('删除成功')</script>");
        //删除成功之后实时刷新
        String SelectSql = "select * from Course ";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}