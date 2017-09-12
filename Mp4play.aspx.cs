using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Data_Binding();
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd1 = new SqlCommand(SelectSql, objConnection);

            cmd1.CommandText = "update S_C_Transcript set Watched =Watched+1  where Cid = '" + (String)Session["Cid"] + "' and Sid in(Select Sid from S_U where Uusername='" + (String)Session["username"] + "')";
            cmd1.ExecuteScalar();
            objConnection.Close();
        }
        
    }
    private void Data_Binding()
    {

        String q = (String)Session["Cid"];
        if ((Convert.ToInt32(q) )== 1){
            string mp4File = ResolveUrl("~/image/3.mp4");
            this.LiteralSource.Text = string.Format("<source type=\"video/mp4\" src=\"{0}\">", mp4File);
        }
        else
        {

            string mp4File1 = ResolveUrl("~/image/2.mp4");
            this.LiteralSource.Text = string.Format("<source type=\"video/mp4\" src=\"{0}\">", mp4File1);
        }
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Study1.aspx");
    }
}