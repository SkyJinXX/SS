using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Study_test : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
       /* using (objConnection)
        {
            string username = "forever";
            string strSQL = "select Qid,Question from Questions";
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, objConnection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            foreach (DataRowView drv in NewMethod(ds).DefaultView)
            {
                Response.Write(drv["Qid"] + "    " + drv["Question"]);

            }
        }
        */
        /*objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SqlStr = "Select  Qid,Question  From  Questions";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        String st1 = (String)cmd.ExecuteScalar();
        TextBox1.Text = st1;
        objConnection.Close();*/
    }

    private static DataTable NewMethod(DataSet ds)
    {
        return ds.Tables[0];
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

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

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_test1.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_exam.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study_discuss.aspx");
    }
    
}