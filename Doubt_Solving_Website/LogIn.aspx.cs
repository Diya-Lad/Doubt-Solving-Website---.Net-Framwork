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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_click(object sender, EventArgs e)
        {
            string email_ = email.Text;
            int id=-1;
            string username = null;
            string password_ = password.Text;
            string password_c=null;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            try
            {
                using (con)
                {
                    string cmd = "Select * From [User] Where email='"+email_+"'";
                    //Response.Write(cmd);
                    SqlCommand sqlCommand = new SqlCommand(cmd,con);
                    con.Open();
                    SqlDataReader dr = sqlCommand.ExecuteReader();
                    //Response.Write(dr);
                    //Response.Write("hello");
                    while (dr.Read())
                    {
                         id= Convert.ToInt32(dr["ID"]);
                        username = Convert.ToString(dr["name"]);
                         password_c = dr.GetString(2); 
                    }
                    dr.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            if(password_c != null)
            {
                if(password_c != password_)
                {
                    Response.Write("Password is incorrect");
                }
                else
                {
                    Session["email"]=email_;
                    Session["user_id"] = id;
                    Session["username"] = username;
                    Response.Redirect("home.aspx");
                    Response.Write("Success");
                }
            }
            else
            {
                Response.Write("No email exist");
            }
        }
    }
}