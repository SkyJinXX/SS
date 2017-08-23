using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Interface_Teacher_Chapter : System.Web.UI.Page
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
        else if ((String)Session["Cid"] == null)
        {
            Response.Write("<script>alert('课程未定');window.location.href='Interface_Teacher_Manage'</script>");
        }
        else
        {
            Label1.Text = (String)Session["username"];
        }
        if (!IsPostBack)
        {
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;

            TextBox1.Visible = false;
            TextBox3.Visible = false;

            Button1.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            Button8.Visible = false;
            Button9.Visible = false;
            Button10.Visible = false;
            Button11.Visible = false;

            FileUpload1.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)

        {

            //指定上传文件在服务器上的保存路径 

            string savePath = Server.MapPath("~/Video/");

            //检查服务器上是否存在这个物理路径，如果不存在则创建 

            if (!System.IO.Directory.Exists(savePath))

            {

                //需要注意的是，需要对这个物理路径有足够的权限，否则会报错 

                //另外，这个路径应该是在网站之下，而将网站部署在C盘却把上传文件保存在D盘 

                System.IO.Directory.CreateDirectory(savePath);

            }

            savePath = savePath + "//" + FileUpload1.FileName;

            FileUpload1.SaveAs(savePath);//保存文件 

            //不过需要注意的是，在客户端访问却需要指定的是URL地址，而不是在服务器上的物理地址 

            Literal1.Text = string.Format("<a href='Video/{0}'>Video/{0}</a>", FileUpload1.FileName);
            Response.Write("<script>alert('上传成功')</script>");
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            String s = "";
            SqlCommand cmd = new SqlCommand(s, objConnection);
            cmd.CommandText = "insert into C_Chapter values ('" + (String)Session["Cid"] + "' , '" + Label6.Text + "' , '"
                + Label12.Text + "','" + TextBox1.Text + "' , '" + FileUpload1.FileName + "' , '" + savePath + "')";

            cmd.ExecuteNonQuery();
            objConnection.Close();
            Response.Write("<script>alert('导入数据库成功')</script>");

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "")
        {
            Response.Write("<script>alert('请输入总章数')</script>");
        }
        else
        {

            Label5.Visible = true;
            Label7.Visible = true;
            Label6.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;

            Button2.Visible = false;
            Button4.Visible = true;
            Button5.Visible = true;
            Button6.Visible = true;
            Button7.Visible = true;
            Button10.Visible = true;

            TextBox3.Visible = true;
            TextBox2.Enabled = false;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        FileUpload1.Visible = false;

        TextBox1.Visible = false;
        TextBox3.Enabled = true;

        Button1.Visible = false;
        Button7.Visible = true;
        Button8.Visible = false;
        Button9.Visible = false;
        Button11.Visible = false;

        Label8.Visible = false;
        Label11.Visible = false;
        Label12.Visible = false;
        Label13.Visible = false;

        TextBox3.Text = "";

        int x = Convert.ToInt32(Label6.Text);
        for (int i = x; i < x + 1; i++)
        {
            if ((x - 1) == 0)
            {
                Label6.Text = x.ToString();
            }
            else
            {
                Label6.Text = (x - 1).ToString();
            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        FileUpload1.Visible = false;

        TextBox1.Visible = false;
        TextBox3.Enabled = true;

        Button1.Visible = false;
        Button7.Visible = true;
        Button8.Visible = false;
        Button9.Visible = false;
        Button11.Visible = false;

        Label8.Visible = false;
        Label11.Visible = false;
        Label12.Visible = false;
        Label13.Visible = false;
        TextBox3.Text = "";
        int x = Convert.ToInt32(Label6.Text);
        for (int i = x; i < x + 1; i++)
        {
            if ((x + 1) > Convert.ToInt32(TextBox2.Text))
            {
                Label6.Text = x.ToString();
            }
            else
            {
                Label6.Text = (x + 1).ToString();
            }
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        if (TextBox3.Text == "")
        {
            Response.Write("<script>alert('请输入总节数')</script>");
        }
        else
        {
            FileUpload1.Visible = true;

            TextBox1.Visible = true;
            TextBox3.Enabled = false;
            
            Button1.Visible = true;
            Button7.Visible = false;
            Button8.Visible = true;
            Button9.Visible = true;
            Button11.Visible = true;

            Label8.Visible = true;
            Label11.Visible = true;
            Label12.Visible = true;
            Label13.Visible = true;

        }
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Label5.Visible = false;
        Label6.Visible = false;
        Label7.Visible = false;
        Label8.Visible = false;
        Label9.Visible = false;
        Label10.Visible = false;
        Label11.Visible = false;
        Label12.Visible = false;
        Label13.Visible = false;

        TextBox1.Visible = false;
        TextBox2.Enabled = true;
        TextBox3.Visible = false;

        Button1.Visible = false;
        Button2.Visible = true;
        Button4.Visible = false;
        Button5.Visible = false;
        Button6.Visible = false;
        Button7.Visible = false;
        Button8.Visible = false;
        Button9.Visible = false;
        Button10.Visible = false;
        Button11.Visible = false;

        FileUpload1.Visible = false;

    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        FileUpload1.Visible = false;

        TextBox1.Visible = false;
        TextBox3.Enabled = true;

        Button1.Visible = false;
        Button7.Visible = true;
        Button8.Visible = false;
        Button9.Visible = false;
        Button11.Visible = false;

        Label8.Visible = false;
        Label11.Visible = false;
        Label12.Visible = false;
        Label13.Visible = false;
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        int x = Convert.ToInt32(Label12.Text);
        for (int i = x; i < x + 1; i++)
        {
            if ((x + 1) > Convert.ToInt32(TextBox3.Text))
            {
                Label12.Text = x.ToString();
            }
            else
            {
                Label12.Text = (x + 1).ToString();
            }
        }
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        int x = Convert.ToInt32(Label12.Text);
        for (int i = x; i < x + 1; i++)
        {
            if ((x - 1) == 0)
            {
                Label12.Text = x.ToString();
            }
            else
            {
                Label12.Text = (x - 1).ToString();
            }
        }
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_CourseManage.aspx");
    }
    
    protected void Button16_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_release.aspx");
    }

    protected void Button17_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Testmanage.aspx");
    }

    protected void Button18_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Testmanage.aspx");
    }

    protected void Button19_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Chapter.aspx");
    }

}
