﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Huiye;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection objConnection = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ToString();
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            objConnection.Open();

            if (Check.CheckLength(input.Text.Length, 10) && Check.CheckLength(input1.Text.Length, 16))
            {
                String SqlStr = "Select Upassword From Users where Uusername = '" + input.Text +
                    "' and Uidentity = '" + input3.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(SqlStr, objConnection);

                String st = input1.Text;
                int l1 = st.Length;
                String st1 = (String)cmd.ExecuteScalar();
                int l2 = st1.Length;

                for (int i = 0; i < l2 - l1; i++)
                    st += ' ';

                if (st == st1)
                {
                    //生成的验证码被保存到session中
                    if (Session["CheckCode"] != null)
                    {
                        string checkcode = Session["CheckCode"].ToString();
                        if (this.TextBox1.Text != checkcode)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('验证码输入错误!')", true);
                        }
                        else
                        {
                            Session["username"] = input.Text;
                            Session["identity"] = input3.SelectedValue;
                            if ((String)Session["identity"] == "T")
                            {
                                Response.Write("<script>alert('登陆成功');window.location.href='Interface_Teacher.aspx'</script>");
                                cmd.CommandText = "select Tname from Teacher where Tid = (select Tid from T_U where Uusername = '" +
                                    input.Text + "')";
                                Session["name"] = cmd.ExecuteScalar().ToString();
                            }
                            else if ((String)Session["identity"] == "S")
                            {
                                Response.Write("<script>alert('登陆成功');window.location.href='Interface_Student_Menu.aspx'</script>");
                                cmd.CommandText = "select Sname from Student where Sid = (select Sid from S_U where Uusername = '" +
                                    input.Text + "')";
                                Session["name"] = cmd.ExecuteScalar().ToString();
                            }
                            else if ((String)Session["identity"] == "A")
                            {
                                Response.Write("<script>alert('登陆成功');window.location.href='Administrator.aspx'</script>");
                                cmd.CommandText = "select Aname from Administrator where Aid = (select Aid from A_U where Uusername = '" +
                                    input.Text + "')";
                                Session["name"] = cmd.ExecuteScalar().ToString();
                            }
                            else
                            {
                                Response.Write("<script>alert('身份错误');window.location.href='Default.aspx'</script>");
                            }
                        }
                    }
                    
                }

                else
                    Response.Write("<script>alert('密码错误');</script>");
                objConnection.Close();

            }
            else
                Response.Write("<script>alert('长度错误')</script>");
            objConnection.Close();

        }
        catch
        {
            Response.Write("<script>alert('登录失败');</script>");
        }
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void Change_Click(object sender, EventArgs e)
    {
        Response.Redirect("Change.aspx");
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void input3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}