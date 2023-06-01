using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doubt_Solving_Website
{
    public partial class UserEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"]==null)
                Response.Redirect("logIn.aspx");
            string email_ = (string)Session["email"];
            string username_=null,password_=null;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    String cmd = "Select * From [User] Where email='" + email_ + "'";
                    SqlCommand sqlCommand = new SqlCommand(cmd, con);
                    SqlDataReader reader = sqlCommand.ExecuteReader();
                    //Response.Write(reader);
                    //Response.Write("hello");
                    while (reader.Read())
                    {
                        password_ = reader.GetString(2);
                        username_ = reader.GetString(3);
                    }
                }
            }
            catch(Exception ex){
                Response.Write(ex.Message);
            }
            if (!IsPostBack)
            {
                //Response.Write("hi");
                uname.Text = username_;
                upassword.Text = password_;
                uemail.Text = email_;
            }
        }

        protected void btnUpdate_click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection();
            string n=uname.Text;
            string p=(upassword.Text);
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    string cmd= "Update [User] set email=@email,password=@password,name=@name where email='"+Session["email"] + "'";
                    //Response.Write(cmd);
                    SqlCommand cmdCommand = new SqlCommand(cmd, con);
                    cmdCommand.Parameters.AddWithValue("email", uemail.Text);
                    cmdCommand.Parameters.AddWithValue("password", upassword.Text);
                    cmdCommand.Parameters.AddWithValue("name", uname.Text);
                    cmdCommand.ExecuteNonQuery();
                    Session["email"]=uemail.Text;
                    uname.Text = n;
                    upassword.Text = p;
                    uemail.Text = (string)Session["email"];
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void email_validation_(object sender, EventArgs e)
        {
            string email_ = uemail.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    string cmd = "Select * From [User] Where email='" + email_ + "'";
                    //Response.Write(cmd);
                    SqlCommand sqlCommand = new SqlCommand(cmd, con);
                    
                    SqlDataReader dr = sqlCommand.ExecuteReader();
                    //Response.Write(dr);
                    //Response.Write("hello");
                    while (dr.Read())
                    {
                        if (dr["email"].ToString() != Session["email"])
                        {
                            Response.Write("Email already exist");
                        }
                    }
                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}