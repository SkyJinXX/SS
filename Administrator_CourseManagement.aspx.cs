using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Default2 : System.Web.UI.Page
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
        }
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        objConnection.Close();
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int row = e.RowIndex;
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
        objConnection.Close();
        //删除成功之后实时刷新
        GridViewFlush();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //删除成功之后实时刷新
        GridViewFlush();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //更新Course表
        String Cid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String Cname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[1])).Text;
        String Ccridit = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[1])).Text;
        String Cpersonnumber = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[1])).Text;
        String Ccategory = ((DropDownList)(GridView1.Rows[e.RowIndex].Cells[4].Controls[1])).SelectedValue;
        String Cintroduction = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[1])).Text;
        String updateSql = "update Course set Cname = '" + Cname + "', Ccredit = '" + Ccridit +
            "', Cpersonnumber = '" + Cpersonnumber + "', Ccategory = '" + Ccategory + "', Cintroduction = '"
            + Cintroduction + "' where Cid = '" + Cid + "'";
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        SqlCommand cmd = new SqlCommand(updateSql, objConnection);
        objConnection.Open();
        cmd.ExecuteNonQuery();
        objConnection.Close();
        GridView1.EditIndex = -1;
        //删除成功之后实时刷新
        GridViewFlush();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //删除成功之后实时刷新
        GridViewFlush();
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

}