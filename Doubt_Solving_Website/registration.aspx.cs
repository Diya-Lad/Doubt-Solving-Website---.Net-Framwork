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
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_click(object sender, EventArgs e)
        {
            string email_ = email.Text;
            string password_ = password.Text;
            string password_c = cpassword.Text;
            string username_ = username.Text;

            if (password_ != password_c)
            {
                Response.Write("Password not matched");
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
                using (con) { 
                    con.Open();
                    string cmd = "Insert into [user] (email,password,name) values (@email,@password,@name)";
                    SqlCommand command = new SqlCommand(cmd, con);
                    command.Parameters.Add("@email", email_);
                    command.Parameters.Add("@password", password_);
                    command.Parameters.Add("@name", username_);
                    command.ExecuteNonQuery();
                }
                
            }

        }

        protected void email_validation_(object sender, EventArgs e)
        {
            string email_ = email.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            try
            {
                using (con)
                {
                    string cmd = "Select * From [User] Where email='" + email_ + "'";
                    //Response.Write(cmd);
                    SqlCommand sqlCommand = new SqlCommand(cmd, con);
                    con.Open();
                    SqlDataReader dr = sqlCommand.ExecuteReader();
                    //Response.Write(dr);
                    //Response.Write("hello");
                    while (dr.Read())
                    {
                        Response.Write("Email already exist");
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
    