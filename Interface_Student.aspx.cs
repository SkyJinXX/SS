using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net;
public partial class _Default : System.Web.UI.Page
{
    public const string courseTimeStart = "2017-08-18 00:00:00";
    public const string courseTimeEnd = "2018-08-19 23:59:59";
    SqlConnection objConnection = new SqlConnection();

    public void GridViewFlush(int a)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        String SelectSql = "";
        if (a == 1)
        {
            SelectSql = GridViewFlush_Condition();
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        if(a == 0)
        {
            SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid " +
                "IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        objConnection.Close();
    }

    protected String GridViewFlush_Condition()
    {
        String SelectSql = "";
        if (TextBox2.Text == "")
        {
            if (TextBox1.Text == "")
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
                    SelectSql = "select * from Course where Cname = '" + TextBox1.Text + "'"; ;
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cname = '"
                        + TextBox1.Text + "'";
                }
            }
        }
        else
        {
            if (TextBox1.Text == "")
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course where Cid = '" + TextBox2.Text + "'";
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cid = '"
                        + TextBox2.Text + "'";
                }
            }
            else
            {
                if (DropDownList1.SelectedValue == "")
                {
                    SelectSql = "select * from Course where Cid = '" + TextBox2.Text + "'and Cname = '"
                        + TextBox1.Text + "'";
                }
                else
                {
                    SelectSql = "select * from Course where Ccategory = '" + DropDownList1.SelectedValue + "'and Cname = '"
                        + TextBox1.Text + "' and Cid = '" + TextBox2.Text + "'";
                }
            }
        }
        return SelectSql;
    }

    public static string GetNetDateTime()
    {
        WebRequest request = null;
        WebResponse response = null;
        WebHeaderCollection headerCollection = null;
        string datetime = string.Empty;
        try
        {
            request = WebRequest.Create("https://www.baidu.com");
            request.Timeout = 3000;
            request.Credentials = CredentialCache.DefaultCredentials;
            response = (WebResponse)request.GetResponse();
            headerCollection = response.Headers;
            foreach (var h in headerCollection.AllKeys)
            { if (h == "Date") { datetime = headerCollection[h]; } }
            return datetime;
        }
        catch (Exception) { return datetime; }
        finally
        {
            if (request != null)
            { request.Abort(); }
            if (response != null)
            { response.Close(); }
            if (headerCollection != null)
            { headerCollection.Clear(); }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('请先登录');window.location.href='default.aspx'</script>");

        }
        else if ((String)Session["identity"] != "S")
        {
            Response.Write("<script>alert('身份错误');window.location.href='default.aspx'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        //显示可选课程
        GridViewFlush(1);
        //显示已选课程
        GridViewFlush(0);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        String SelectSql = GridViewFlush_Condition();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlCommand cmd = new SqlCommand(SelectSql, objConnection);
        cmd.CommandText = SelectSql;

        if ((String)cmd.ExecuteScalar() == null)
        {
            Response.Write("<script>alert('查无此课程')</script>");
            SelectSql = "select * from Course ";
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



    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Session["name"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string dt = GetNetDateTime();
        string DT = Convert.ToDateTime(dt).ToString("yyyy-MM-dd HH:mm:ss");
        if (string.Compare(DT, courseTimeStart ) ==-1||string.Compare(DT,courseTimeEnd)==1)
        {
            Response.Write("<script>alert('Time Error! You can pick course between ')</script>");
        }
        else {
            int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            String str1 = GridView1.Rows[row].Cells[0].Text;
            String str2 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
            objConnection.Open();
            //验证课程是否重复选择
            String SqlStr = "Select Sid,Cid From S_C_Transcript Where Cid = '" + str1 + "' and Sid IN(select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            if (cmd.ExecuteScalar() != null)
                Response.Write("<script>alert('课程已选择，请勿重复选择')</script>");
            //将用户选择课程数据插入到数据库表中
            else
            {
                SqlStr = "Insert into S_C_Transcript select Sid, '" + str1 + "', '', '', '', '', '', '', '' from S_U where Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
                cmd = new SqlCommand(SqlStr, objConnection);
                cmd.CommandText = SqlStr;
                cmd.ExecuteScalar();
                Response.Write("<script>alert('选课成功')</script>");
                //选课成功之后实时刷新
                String SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
                SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }

        }
    }



    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        String str1 = GridView2.Rows[row].Cells[0].Text;
        String str2 = "select Sid from S_U where Uusername = '" + (String)Session["username"] + "'";
        objConnection.Open();
        String SqlStr = "Delete S_C_Transcript where Cid = '" + str1 + "' and Sid = (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
        cmd.CommandText = SqlStr;
        cmd.ExecuteScalar();
        Response.Write("<script>alert('退选成功')</script>");
        //退选成功之后实时刷新
        String SelectSql = "select * from Course,S_C_Transcript where Course.Cid = S_C_Transcript.Cid and S_C_Transcript.Sid IN (select Sid from S_U where Uusername = '" + (String)Session["username"] + "')";
        SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["Cid"] = GridView1.Rows[row].Cells[0].Text;
        Response.Redirect("Study.aspx");
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Student_Menu.aspx");
    }
}