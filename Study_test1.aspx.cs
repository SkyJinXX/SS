using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    DateTime NowTime;//当前时间  
    DateTime EndTime = Convert.ToDateTime("2017-8-13 23:59:59");//结束时间  
    
    int count = 0;
    int n = 3;
    SqlConnection objConnection = new SqlConnection();
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
        if(!IsPostBack)
        {
            /*
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlDataAdapter sda = new SqlDataAdapter();
        string sql = "select Qid,Question  from Questions where Cid='"+(String)Session["Cid"]+"'";
        sda.SelectCommand = new SqlCommand(sql, objConnection);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();
        objConnection.Close();
        */
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            string sql = "select Qid, Question,ChoiceA,ChoiceB,ChoiceC,ChoiceD  from ChoiceQuestion where Cid='" + (String)Session["Cid"] + "' and ChapterName='"+(String)Session["ChapterName"]+"'and SectionName='"+(String)Session["SectionName"]+"' ";
            sda.SelectCommand = new SqlCommand(sql, objConnection);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            objConnection.Close();

            //TimeSpan CountdownSpan = new TimeSpan(0, 20, 0);
            //this.Timer1.Enabled = true;
            NowTime = DateTime.Now;
            
           
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        for (int i = 0; i < 2; i++)
        {
            String ql = ((Label)DataList1.Items[i].FindControl("Label8")).Text;
            String SqlStr = "Select Answer From ChoiceQuestion  where Qid='" + ql + "' and Cid='" + (String)Session["Cid"] + "' and ChapterName='" + (String)Session["ChapterName"] + "'and SectionName='" + (String)Session["SectionName"] + "'";
            SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
            int st = Convert.ToInt16(cmd.ExecuteScalar());
            RadioButtonList rd = (RadioButtonList)DataList1.Items[i].FindControl("RadioButtonList1");
            // TextBox1.Text = rd.SelectedValue;
            //TextBox2.Text = st;
            if (Convert.ToInt16(rd.SelectedValue) == st)
            {
                count += 10;
            }
            else
                count += 0;
        }

        Response.Write("<script>alert('你的分数为:" + count.ToString() + "');</script>");

        //did+1
        String SelectSql = "";
        SqlCommand cmd1 = new SqlCommand(SelectSql, objConnection);

        cmd1.CommandText = "update S_C_Transcript set Did =Did+1  where Cid = '" + (String)Session["Cid"]+"' and Sid in(Select Sid from S_U where Uusername='"+(String)Session["username"]+"')";
        cmd1.ExecuteScalar();
        objConnection.Close();
        //Response.Redirect("Study_test.aspx");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Study.aspx");
    }
   
    
    
}