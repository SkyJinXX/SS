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
            int id = 1;
            if (cmd.ExecuteScalar() != DBNull.Value)
                id = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
            TextBox1.Text = id.ToString();
            Button6.Visible = false;
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

    protected void Button7_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();

        objConnection.Open();

        String SelectSql = "";

        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        //插入Course, T_C
        cmd.CommandText = "insert into Course values('" + TextBox1.Text +
          "', '" + TextBox2.Text + "', " + TextBox3.Text + ", " + TextBox4.Text + ", '"
          + DropDownList1.SelectedValue.ToString() + "', '" + TextBox6.Text + "')";
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
        Button6.Visible = false;
        objConnection.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["Cid"] = GridView1.Rows[row].Cells[0].Text;
        Response.Redirect("Interface_Teacher_CourseManage.aspx");
    }

    

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher.aspx");
    }
}