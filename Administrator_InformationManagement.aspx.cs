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
        GridView2.DataSource = ds;
        GridView2.DataBind();
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
        objConnection.Close();
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
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        objConnection.Close();
    }


    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Administrator_announcement.aspx");
    }



    protected void Button11_Click(object sender, EventArgs e)
    {
        int i;
        objConnection.Open();
        String s = "";
        SqlCommand cmd = new SqlCommand(s, objConnection);
        if (Label13.Text == "1")
        {
            for (i = 0; i < GridView2.Rows.Count; i++)
            {
                if (((CheckBox)GridView2.Rows[i].FindControl("CheckBox1")).Checked == true)
                {
                    cmd.CommandText = "Select Cid from C_Time where Cid = '" + GridView2.Rows[i].Cells[1].Text + "'";
                    if (cmd.ExecuteScalar() != null)
                    {
                        String a = GridView2.Rows[i].Cells[1].Text;
                        Response.Write("<script>alert('课程号为 " + a + " 的课程已经设置过，若要操作请进行修改')</script>");
                    }
                    else
                    {
                        s = "insert into C_Time values('" + GridView2.Rows[i].Cells[1].Text + "' , Convert(datetime,'" +
                            TextBox8.Text + "') ,Convert(datetime,'" + TextBox9.Text + "') , Convert(datetime,'"
                            + TextBox10.Text + "') ,Convert(datetime,'" + TextBox11.Text + "'))";
                        cmd.CommandText = s;
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('设置成功')</script>");
                    }
                }
            }

        }

        if (Label13.Text == "2")
        {
            for (i = 0; i < GridView2.Rows.Count; i++)
            {
                if (((CheckBox)GridView2.Rows[i].FindControl("CheckBox1")).Checked == true)
                {
                    
                    cmd.CommandText = "update C_Time Set CourseIn_Time_Begin =  Convert(datetime,'" +
                        TextBox8.Text + "') where Cid = '" + GridView2.Rows[i].Cells[1].Text + "'";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "update C_Time Set CourseIn_Time_End =  Convert(datetime,'" +
                        TextBox9.Text + "') where Cid = '" + GridView2.Rows[i].Cells[1].Text + "'";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "update C_Time Set CourseOut_Time_Begin =  Convert(datetime,'" +
                        TextBox10.Text + "') where Cid = '" + GridView2.Rows[i].Cells[1].Text + "'";
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "update C_Time Set CourseOut_Time_End =  Convert(datetime,'" +
                        TextBox11.Text + "') where Cid = '" + GridView2.Rows[i].Cells[1].Text + "'";
                    cmd.ExecuteNonQuery();

                }
            }
            Response.Write("<script>alert('修改成功')</script>");
        }
        objConnection.Close();
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

        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";

        Button11.Visible = true;
        Button11.Text = "设置";

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

        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";

        Button11.Visible = true;
        Button11.Text = "修改";
        Label13.Text = "2";
        int i;
        objConnection.Open();
        String s = "";
        SqlCommand cmd = new SqlCommand(s, objConnection);
        for (i = 0; i < GridView2.Rows.Count; i++)
        {
            if (((CheckBox)GridView2.Rows[i].FindControl("CheckBox1")).Checked == true)
            {
                DateTime a;
                cmd.CommandText = "select CourseIn_Time_Begin from C_Time where Cid = '" + GridView2.Rows[i].Cells[1].Text
                     + "'";
                if (cmd.ExecuteScalar() == null)
                {
                    TextBox8.Text = "";
                }
                else
                {
                    a = Convert.ToDateTime(cmd.ExecuteScalar().ToString());
                    TextBox8.Text = a.ToString("yyyy-MM-dd hh:mm:ss");
                }

                cmd.CommandText = "select CourseIn_Time_End from C_Time where Cid = '" + GridView2.Rows[i].Cells[1].Text
                     + "'";
                if (cmd.ExecuteScalar() == null)
                {
                    TextBox9.Text = "";
                }
                else
                {
                    a = Convert.ToDateTime(cmd.ExecuteScalar().ToString());
                    TextBox9.Text = a.ToString("yyyy-MM-dd hh:mm:ss");
                }
                cmd.CommandText = "select CourseOut_Time_Begin from C_Time where Cid = '" + GridView2.Rows[i].Cells[1].Text
                                     + "'";
                if (cmd.ExecuteScalar() == null)
                {
                    TextBox10.Text = "";
                }
                else
                {
                    a = Convert.ToDateTime(cmd.ExecuteScalar().ToString());
                    TextBox10.Text = a.ToString("yyyy-MM-dd hh:mm:ss");
                }
                cmd.CommandText = "select CourseOut_Time_End from C_Time where Cid = '" + GridView2.Rows[i].Cells[1].Text
                                     + "'";
                if (cmd.ExecuteScalar() == null)
                {
                    TextBox11.Text = "";
                }
                else
                {
                    a = Convert.ToDateTime(cmd.ExecuteScalar().ToString());
                    TextBox11.Text = a.ToString("yyyy-MM-dd hh:mm:ss");
                }

            }
        }

    }

}