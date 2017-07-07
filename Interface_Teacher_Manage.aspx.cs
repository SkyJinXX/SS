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
        else if ((String)Session["identity"] != "T")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        
        
        
        if (!IsPostBack)
        {
            //设置默认课程号
            TextBox1.Enabled = false;
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
            cmd.CommandText = "select max(Cid) from Course";
            int id = 0;
            if (cmd.ExecuteScalar() != null)
                id = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
            TextBox1.Text = id.ToString();
            Button5.Visible = false;
            objConnection.Close();
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            SelectSql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" + (String)Session["username"] + "'))";
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    protected void Button_Change_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button_Create_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Rank.aspx");
    }


    protected void Button5_Click(object sender, EventArgs e)
    {
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();

        objConnection.Open();

        String SelectSql = "";

        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);              
            //插入Course, T_C
            cmd.CommandText = "insert into Course values('" + TextBox1.Text +
              "', '" + TextBox2.Text + "', " + TextBox3.Text + ", " + TextBox4.Text + ", '"
              + TextBox5.Text + "', '" + TextBox6.Text + "')";
            cmd.ExecuteScalar();
            cmd.CommandText = "insert into T_C(Tid, Cid) select Tid, '" + TextBox1.Text + "' from T_U where Uusername = '" +
                (String)Session["username"] + "'";
            cmd.ExecuteScalar();
            objConnection.Close();
            //刷新GridView
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String Sql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" + (String)Session["username"] + "'))";
            SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //设置默认课程号
            TextBox1.Enabled = false;
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            SelectSql = "";
            cmd = new SqlCommand(SelectSql, objConnection);
            cmd.CommandText = "select max(Cid) from Course";
            int id = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
            TextBox1.Text = id.ToString();
            Button5.Visible = false;
            objConnection.Close();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["Cid"] = GridView1.Rows[row].Cells[0].Text;
        Response.Redirect("Interface_Teacher_SM.aspx");
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String Cid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        String Cname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[1])).Text;
        String Ccridit = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[1])).Text;
        String Cpersonnumber = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[1])).Text;
        String Ccategory = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[1])).Text;
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
        //刷新GridView
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" + (String)Session["username"] + "'))";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //刷新GridView
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" 
            + (String)Session["username"] + "'))";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //刷新GridView
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String Sql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" + (String)Session["username"] + "'))";
        SqlDataAdapter da = new SqlDataAdapter(Sql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}