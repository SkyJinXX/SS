using System;
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
            Label1.Text = (String)Session["username"];
        }
        if (!IsPostBack)  // 页面首次加载
        {
            // 返回指定目录的所有文件的名称
            string[] AllFile = Directory.GetFiles(Server.MapPath("~\\test\\"));
            foreach (string Name in AllFile)
            {
                // 返回指定路径的文件的名称
                ListBox1.Items.Add(Path.GetFileName(Name));
            }

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
    protected void Button6_Click(object sender, EventArgs e)
    {
        string strName = FileUpload1.PostedFile.FileName;//使用fileupload控件获取上传文件的文件名
        if (strName != "")//如果文件名存在
        {
            bool fileOK = false;
            int i = strName.LastIndexOf(".");//获取。的索引顺序号，在这里。代表图片名字与后缀的间隔
            string kzm = strName.Substring(i);//获取文件扩展名的另一种方法 string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string newName = Guid.NewGuid().ToString();//生成新的文件名，保证唯一性

            string xiangdui = @"~\test\";//设置文件相对网站根目录的保存路径 ，~号表示当前目录，在此表示根目录下的images文件夹
            string juedui = Server.MapPath("~\\test\\");//设置文件保存的本地目录绝对路径，对于路径中的字符“＼”在字符串中必须以“＼＼”表示，因为“＼”为特殊字符。或者可以使用上一行的给路径前面加上＠
            string newFileName = juedui + newName + kzm;
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
                try
                {
                    // 判定该路径是否存在
                    if (!Directory.Exists(juedui))
                        Directory.CreateDirectory(juedui);
                    // Label3.Text = newFileName;     //为了能看清楚我们提取出来的图片地址，在这使用label
                    /* Label4.Text = "<b>原文件路径：</b>" + FileUpload1.PostedFile.FileName + "<br />" +
                                       "<b>文件大小：</b>" + FileUpload1.PostedFile.ContentLength + "字节<br />" +
                                       "<b>文件类型：</b>" + FileUpload1.PostedFile.ContentType + "<br />";
                                       */
                    // Label3.Text = xiangdui + newName + kzm;
                    // Label6.Text = "文件上传成功.";
                    //Label3.Text = strName;

                   Response.Write("<script>alert('文件上传成功')</script>");
                    FileUpload1.PostedFile.SaveAs(newFileName);//将图片存储到服务器上
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('文件上传失败')</script>");
                   // Label6.Text = "文件上传失败.";
                }
            }
            else
            {
                Response.Write("<script>alert('不能上传该类型文件')</script>");
               // Label6.Text = "只能够上传图片文件.";
            }
        }
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        bool isDelete = true;
        //String path = Server.MapPath("~\\test\\");
        String path = Server.MapPath(strName);
        if (System.IO.File.Exists(path))
        {
            Response.Write("<script>alert('文件删除成功')</script>");
            /*
            try
            {
                System.IO.File.Delete(path);
                Response.Write("<script>alert('文件删除成功')</script>");
            }
            catch (Exception)
            {
                isDelete = false;
            }
            */
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
        Session["Cid"] = GridView1.Rows[row].Cells[0].Text;
        Response.Redirect("Interface_Teacher_Setdate1.aspx");
    }
}