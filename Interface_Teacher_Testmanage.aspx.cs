﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_Teache_Testmanage : System.Web.UI.Page
{
    public String strName;
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
            Label1.Text = (String)Session["name"];
        }
        if (!IsPostBack)  // 页面首次加载
        {
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            objConnection.Open();
            SqlCommand cm = new SqlCommand("select Ctestname from Ctest", objConnection);

            SqlDataReader dr = cm.ExecuteReader();

            //绑定

            this.ListBox1.DataSource = dr;        //lbxEmp为ListBox对象

            this.ListBox1.DataTextField = "Ctestname";
            this.ListBox1.DataBind();
            
            objConnection.Close();
            /*
            // 返回指定目录的所有文件的名称
            string[] AllFile = Directory.GetFiles(Server.MapPath("~/test/"));
            foreach (string Name in AllFile)
            {
                // 返回指定路径的文件的名称
                ListBox1.Items.Add(Path.GetFileName(Name));
            }
            */
            //显示课程
            objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
            String SelectSql = "select Cid,Cname from Course where Cid IN (Select Cid from T_C where Tid = (select Tid from T_U where Uusername = '" + (String)Session["username"] + "'))";
            SqlDataAdapter da = new SqlDataAdapter(SelectSql, objConnection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    public void DownLoadFile(string FullFileName)
    {
        // 保存文件的虚拟路径
        string Url = "test\\" + FullFileName;
        // 保存文件的物理路径
        string FullPath = HttpContext.Current.Server.MapPath(Url);
        // 初始化FileInfo类的实例，作为文件路径的包装
        FileInfo FI = new FileInfo(FullPath);
        // 判断文件是否存在
        if (FI.Exists)
        {
            // 将文件保存到本机
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment;filename=" + Server.UrlEncode(FI.Name));
            Response.AddHeader("Content-Length", FI.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.Filter.Close();
            Response.WriteFile(FI.FullName);
            Response.End();
        }
    }

    // 删除文件类
    public void DeleteFile(string FullFileName)
    {
        // 保存文件的虚拟路径
        string Url = "test\\" + FullFileName;
        // 保存文件的物理路径
        string FullPath = HttpContext.Current.Server.MapPath(Url);
        // 去除文件的只读属性
        //File.SetAttributes(FullPath, FileAttributes.Normal);
        // 初始化FileInfo类的实例，作为文件路径的包装
        FileInfo FI = new FileInfo(FullPath);
        // 判断文件是否存在
        if (FI.Exists)
        {
            FI.Delete();
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        string strName = FileUpload1.PostedFile.FileName;//使用fileupload控件获取上传文件的文件名
        if (strName != "")//如果文件名存在
        {
            bool fileOK = false;
            int i = strName.LastIndexOf(".");//获取。的索引顺序号，在这里。代表图片名字与后缀的间隔
            string kzm = strName.Substring(i);//获取文件扩展名的另一种方法 string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string newName = Guid.NewGuid().ToString();//生成新的文件名，保证唯一性

            string xiangdui = @"~\test\";//设置文件相对网站根目录的保存路径 ，~号表示当前目录，在此表示根目录下的images文件夹
            string juedui = Server.MapPath("~\\test\\");//设置文件保存的本地目录绝对路径，对于路径中的字符“＼”在字符串中必须以“＼＼”表示，因为“＼”为特殊字符。或者可以使用上一行的给路径前面加上＠
            string newFileName = juedui + strName;
            if (FileUpload1.HasFile)//验证 FileUpload 控件确实包含文件
            {
                String[] allowedExtensions = { ".gif", ".png", ".bmp", ".docx", ".txt" };
                for (int j = 0; j < allowedExtensions.Length; j++)
                {
                    if (kzm == allowedExtensions[j])
                    {
                        fileOK = true;
                    }
                }
            }
            if (fileOK)
            {
                // 判定该路径是否存在
                //if (!Directory.Exists(juedui))
                // Directory.CreateDirectory(juedui);
                // Label3.Text = newFileName;     //为了能看清楚我们提取出来的图片地址，在这使用label
                /* Label4.Text = "<b>原文件路径：</b>" + FileUpload1.PostedFile.FileName + "<br />" +
                                   "<b>文件大小：</b>" + FileUpload1.PostedFile.ContentLength + "字节<br />" +
                                   "<b>文件类型：</b>" + FileUpload1.PostedFile.ContentType + "<br />";
                                   */
                // Label3.Text = xiangdui + newName + kzm;
                // Label6.Text = "文件上传成功.";
                //Label3.Text = strName;

                //Response.Write("<script>alert('文件上传成功')</script>");
                // FileUpload1.PostedFile.SaveAs(newFileName);//将图片存储到服务器上
                try
                {
                    // 检查文件是否存在
                    if (File.Exists(newFileName))
                    {
                        HttpContext.Current.Response.Write("<script>alert('文件已存在，请重新上传。');</script>");
                    }
                    else
                    {
                        FileUpload1.SaveAs(newFileName);
                        HttpContext.Current.Response.Write("<script>alert('文件已成功上传。');</script>");
                    }
                }
                catch { }
            }
            else
            {
                Response.Write("<script>alert('不能上传该类型文件')</script>");
                // Label6.Text = "只能够上传图片文件.";
            }
            String s = "";
            SqlCommand cmd = new SqlCommand(s, objConnection);
            cmd.CommandText = "insert into Ctest values ('" + (String)Session["Cid"] + "' , '"+strName+"' , '"
                + newFileName + "')";

            cmd.ExecuteScalar();
        }
        else
        {
            Response.Write("<script>alert('请选择文件')</script>");
        }
        objConnection.Close();
        //刷新listbox
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlCommand cm = new SqlCommand("select Ctestname from Ctest", objConnection);

        SqlDataReader dr = cm.ExecuteReader();

        //绑定

        this.ListBox1.DataSource = dr;        //lbxEmp为ListBox对象

        this.ListBox1.DataTextField = "Ctestname";
        this.ListBox1.DataBind();
        objConnection.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_CourseManage.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_SM.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_release.aspx");
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Testmanage.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        // 判断是否选择了文件名
        if (ListBox1.SelectedValue != "")
        {
            if ((String)Session["SelectedFile"] != "")
            {
                string FullFileName = Session["SelectedFile"].ToString();
                DownLoadFile(FullFileName);
            }
        }
        else
        {
            Response.Write("<script>alert('请先选择要下载的文件')</script>");
        }
    }

    protected void Button8_Click(object sender, EventArgs e)
    {

        // 判断是否选择了文件名
        if (ListBox1.SelectedValue != "")
        {
            if ((String)Session["SelectedFile"] != "")
            {
                string FullFileName = Session["SelectedFile"].ToString();
                DeleteFile(FullFileName);
                //Response.Redirect(Request.Url.PathAndQuery.ToString());
                Response.Write("<script>alert('文件成功删除')</script>");
                //删除数据库
                objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
                objConnection.Open();
                String SqlStr = "delete  from Ctest where  Cid ='" + (String)Session["Cid"] + "' and Ctestname='" + FullFileName + "'";
        SqlCommand cmd = new SqlCommand(SqlStr, objConnection);
                cmd.CommandText = SqlStr;
                cmd.ExecuteScalar();
                objConnection.Close();
                
            }
        }
        else
        {
            Response.Write("<script>alert('请先选择要删除的文件')</script>");
        }
        //刷新listbox
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        objConnection.Open();
        SqlCommand cm = new SqlCommand("select Ctestname from Ctest", objConnection);

        SqlDataReader dr = cm.ExecuteReader();

        //绑定

        this.ListBox1.DataSource = dr;        //lbxEmp为ListBox对象

        this.ListBox1.DataTextField = "Ctestname";
        this.ListBox1.DataBind();
        objConnection.Close();

    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedFile"] = ListBox1.SelectedValue.ToString();
    }
    

    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_ChapterManage.aspx");
    }




    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Setdate1.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["identity"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Change.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Interface_Teacher_Manage.aspx");
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        Session["SelectedFile"] = Button12.Text;
        string FullFileName = Session["SelectedFile"].ToString();
        DownLoadFile(FullFileName);
    }

    
}