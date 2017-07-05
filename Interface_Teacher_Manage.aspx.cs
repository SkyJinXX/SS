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
        //刷新GridView
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        String SelectSql = "select * from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '"+(String)Session["username"]+"'))";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
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

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if(RadioButtonList1.SelectedIndex == 0)
        {
            TextBox1.Enabled = false;
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String SelectSql = "";
            SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
            cmd.CommandText = "select count(*) from Course";
            int id = (int)cmd.ExecuteScalar() + 1;
            TextBox1.Text = id.ToString();
            Button5.Visible = false;
            objConnection.Close();
        }
        else
        {
            TextBox1.Enabled = true;
            Button5.Visible = true;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        cmd.CommandText = "select Cname from Course where Cid = '" + TextBox1.Text + "'";
        TextBox2.Text = (String)cmd.ExecuteScalar();

        if (TextBox2.Text != "")
        {
            cmd.CommandText = "select Ccredit from Course where Cid = '" + TextBox1.Text + "'";
            TextBox3.Text = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "select Cpersonnumber from Course where Cid = '" + TextBox1.Text + "'";
            TextBox4.Text = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "select Ccategory from Course where Cid = '" + TextBox1.Text + "'";
            TextBox5.Text = (String)cmd.ExecuteScalar();
            cmd.CommandText = "select Cintroduction from Course where Cid = '" + TextBox1.Text + "'";
            TextBox6.Text = (String)cmd.ExecuteScalar();            
        }
        else
        {
            Response.Write("<script>alert('课程号错误')</script>");
        }
        objConnection.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "";
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        if (RadioButtonList1.SelectedIndex == 0)
        {
            //插入Course, T_C
            cmd.CommandText = "insert into Course values('" + TextBox1.Text +
              "', '" + TextBox2.Text + "', " + TextBox3.Text + ", " + TextBox4.Text + ", '"
              + TextBox5.Text + "', '" + TextBox6.Text + "')";
            cmd.ExecuteScalar();
            cmd.CommandText = "insert into T_C(Tid, Cid) select Tid, '"+ TextBox1.Text + "' from T_U where Uusername = '" +
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
        }
        else if(RadioButtonList1.SelectedIndex == 1)
        {
            //更新数据库表
            cmd.CommandText = "update Course set Cname = '" + TextBox2.Text + "' where Cid = '"
                + TextBox1.Text + "'";
            cmd.ExecuteScalar();
            cmd.CommandText = "update Course set Ccredit = " + TextBox3.Text + " where Cid = '"
                + TextBox1.Text + "'";
            cmd.ExecuteScalar();
            cmd.CommandText = "update Course set Cpersonnumber = " + TextBox4.Text + " where Cid = '"
                + TextBox1.Text + "'";
            cmd.ExecuteScalar();
            cmd.CommandText = "update Course set Ccategory = '" + TextBox5.Text + "' where Cid = '"
                + TextBox1.Text + "'";
            cmd.ExecuteScalar();
            cmd.CommandText = "update Course set Cintroduction = '" + TextBox6.Text + "' where Cid = '"
                + TextBox1.Text + "'";
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
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}