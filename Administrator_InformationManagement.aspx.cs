using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Administrator_InformationManagement : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();

    public void GridViewFlush()
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = GridViewFlush_Condition();
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        objConnection.Close();
    }

    protected String GridViewFlush_Condition()
    {
        String SelectSql = "";
        if (TextBox6.Text == "")
        {
            if (TextBox7.Text == "")
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course ";
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'";
                }
            }
            else
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course where Cname = '" + TextBox7.Text + "'"; ;
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cname = '"
                        + TextBox7.Text + "'";
                }
            }
        }
        else
        {
            if (TextBox7.Text == "")
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course where Cid = '" + TextBox6.Text + "'";
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cid = '"
                        + TextBox6.Text + "'";
                }
            }
            else
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course where Cid = '" + TextBox6.Text + "'and Cname = '"
                        + TextBox7.Text + "'";
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cname = '"
                        + TextBox7.Text + "' and Cid = '" + TextBox6.Text + "'";
                }
            }
        }
        return SelectSql;
    }

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
            Label1.Text = (String)Session["name"];
        }

        if (!IsPostBack)
        {
            GridViewFlush();
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;

            TextBox8.Visible = false;
            TextBox9.Visible = false;
            TextBox10.Visible = false;
            TextBox11.Visible = false;

            Button11.Visible = false;
        }

        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String a = "select Alevel from Administrator where Aid in ( select Aid from A_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd1 = new SqlCommand(a, objConnection);
        int b = Convert.ToInt32(cmd1.ExecuteScalar());
        if (b < 2)
        {
            Button2.Enabled = false;
        }
        if (b < 3)
        {
            Button3.Enabled = false;
        }
        if (b < 4)
        {
            Button4.Enabled = false;
        }
        if (b < 5)
        {
            Button5.Enabled = false;
        }
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_RightsManagement.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_Register");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_UsersManagement.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_CourseManagement.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Session["name"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_TranscriptManagement.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_individual.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        String SelectSql = GridViewFlush_Condition();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        cmd.CommandText = SelectSql;

        if ((String)cmd.ExecuteScalar() == null)
        {
            Response.Write("<script>alert('查无此课程')</script>");
        }
        else
        {
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        objConnection.Close();
    }


    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_announcement.aspx");
    }



    protected void Button11_Click(object sender, EventArgs e)
    {

    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        Label9.Visible = true;
        Label10.Visible = true;
        Label11.Visible = true;
        Label12.Visible = true;

        TextBox8.Visible = true;
        TextBox9.Visible = true;
        TextBox10.Visible = true;
        TextBox11.Visible = true;

        Button11.Visible = true;
        Button12.Visible = false;
        Button13.Visible = false;

        Label13.Text = "1";
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Label9.Visible = true;
        Label10.Visible = true;
        Label11.Visible = true;
        Label12.Visible = true;

        TextBox8.Visible = true;
        TextBox9.Visible = true;
        TextBox10.Visible = true;
        TextBox11.Visible = true;

        Button11.Visible = true;
        Button12.Visible = false;
        Button13.Visible = false;

        Label13.Text = "2";

    }
}