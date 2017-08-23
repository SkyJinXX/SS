using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_announcement : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            Label3.Visible = false;
            TextBox1.Visible = false;
            Button5.Visible = false;
        }
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        int i;
        objConnection.Open();
        String s = "";
        SqlCommand cmd = new SqlCommand(s, objConnection);
          
        if (Label2.Text == "1")
        {
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                if(((CheckBox)GridView1.Rows[i].FindControl("CheckBox1")).Checked == true)
                {
                    s = "insert into A_A_Management values('";
                }
            }
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label3.Visible = true;
        TextBox1.Visible = true;
        Button5.Visible = true;
        GridView1.Visible = false;
        GridView2.Visible = true;
        GridView3.Visible = false;
        Label2.Text = "2";

        objConnection.Open();
        String SelectSql = "select Tid, Tname, Tsex, Tbirthday, Tprofession, Tphone from Teacher";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        objConnection.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Label3.Visible = true;
        TextBox1.Visible = true;
        Button5.Visible = true;
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = true;
        Label2.Text = "3";

        objConnection.Open();
        String SelectSql = "select Sid , Sname , Ssex , Sbirthday ,Sage , Sschool , Scollege , Smajor, Sphone from Student";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView3.DataSource = ds;
        GridView3.DataBind();
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label3.Visible = true;
        TextBox1.Visible = true;
        Button5.Visible = true;
        GridView1.Visible = true;
        GridView2.Visible = false;
        GridView3.Visible = false;
        Label2.Text = "1";

        objConnection.Open();
        String SelectSql = "select Aid, Aname, Asex, Abirthday, Aage from Administrator " +
            " where Aid != (select Aid from A_U where Uusername = '" + (string)Session["username"] + "')";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }
    protected void GridView1_SelectAll(object sender, EventArgs e)
    {
        int i;
        if (((CheckBox)sender).Checked)
        {
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                ((CheckBox)GridView1.Rows[i].FindControl("CheckBox1")).Checked = true;
            }
        }
        else
        {
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                ((CheckBox)GridView1.Rows[i].FindControl("CheckBox1")).Checked = false;
            }
        }
    }

    protected void GridView2_SelectAll(object sender, EventArgs e)
    {
        int i;
        if (((CheckBox)sender).Checked)
        {
            for (i = 0; i < GridView2.Rows.Count; i++)
            {
                ((CheckBox)GridView2.Rows[i].FindControl("CheckBox1")).Checked = true;
            }
        }
        else
        {
            for (i = 0; i < GridView2.Rows.Count; i++)
            {
                ((CheckBox)GridView2.Rows[i].FindControl("CheckBox1")).Checked = false;
            }
        }
    }



    protected void GridView3_SelectAll(object sender, EventArgs e)
    {
        int i;
        if (((CheckBox)sender).Checked)
        {
            for (i = 0; i < GridView3.Rows.Count; i++)
            {
                ((CheckBox)GridView3.Rows[i].FindControl("CheckBox1")).Checked = true;
            }
        }
        else
        {
            for (i = 0; i < GridView3.Rows.Count; i++)
            {
                ((CheckBox)GridView3.Rows[i].FindControl("CheckBox1")).Checked = false;
            }
        }
    }
}