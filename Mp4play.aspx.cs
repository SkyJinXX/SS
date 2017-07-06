using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Data_Binding();
        }
    }
    private void Data_Binding()
    {
        string mp4File = ResolveUrl("~/image/1.mp4");
        this.LiteralSource.Text = string.Format("<source type=\"video/mp4\" src=\"{0}\">", mp4File);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study.aspx");
    }
}