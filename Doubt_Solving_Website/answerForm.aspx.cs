using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Doubt_Solving_Website
{
    public partial class answerForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("logIn.aspx");
            int queId = Convert.ToInt32(Request["que"]);
            //Response.Write(Request["que"].ToString());
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            
            string cmd = "Select * From Doubts Where id="+queId;
            //Response.Write(user);
            SqlCommand sqlCommand = new SqlCommand(cmd, con);
            try
            {
                using (con)
                {
                    con.Open();
                    SqlDataReader rdr = sqlCommand.ExecuteReader();
                    string que_=null;
                    while (rdr.Read())
                    {
                        que_ = (string)rdr["Question"];
                        Question.Text = que_;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }

        protected void clickPostAns(object sender, EventArgs e)
        {
            string ans_ = ans.Text;
            int queId = Convert.ToInt32(Request["que"]);
            int userId = Convert.ToInt32(Session["user_id"]);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            using (con)
            {
                con.Open();
                string cmd = "Insert into Answers (que_id,user_id,answer,time,username) values (@q,@u,@a,@t,@n)";
                SqlCommand command = new SqlCommand(cmd, con);
                command.Parameters.Add("@q", queId);
                command.Parameters.Add("@u", userId);
                command.Parameters.Add("@a", ans_);
                command.Parameters.Add("@t", DateTime.Now.ToString("HH:mm:ss"));
                command.Parameters.Add("@n", Convert.ToString(Session["username"]));
                command.ExecuteNonQuery();
            }

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}