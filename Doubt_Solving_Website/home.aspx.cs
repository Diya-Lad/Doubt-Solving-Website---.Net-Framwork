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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("logIn.aspx");
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            string cmd = "Select * from Doubts";
            using (con)
            {
                SqlCommand command = new SqlCommand(cmd, con);
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                string que_ = null;
                while (reader.Read())
                {
                    que_ = (string)reader["Question"];
                    //Response.Write(que_);
                }
            }
        }

        protected void btnPost_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            string que = question.Text;
            int type = Convert.ToInt32(typeDoubt.SelectedItem.Value);
            int user = Convert.ToInt32(Session["user_id"]);
            string cmd = "Insert into Doubts (Question,user_id,type) values (@Question,@user_id,@type)";
            //Response.Write(user);
            SqlCommand sqlCommand = new SqlCommand(cmd, con);
            try
            {
                using (con)
                {
                    con.Open();
                    sqlCommand.Parameters.AddWithValue("@Question", que);
                    sqlCommand.Parameters.AddWithValue("@user_id", user);
                    sqlCommand.Parameters.AddWithValue("@type", type);
                    sqlCommand.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

       

        protected void ansBtnSubmit(object sender, EventArgs e)
        {
            var button = sender as LinkButton;
            var dataListItem = button.Parent as DataListItem;
            var queId = (dataListItem.FindControl("QuestionId") as HiddenField).Value;
            //AnsSubmit(queId);
            //Response.Write(queId);
            //Response.Redirect("answerForm.aspx", false);
            Response.Redirect("answerForm.aspx?que=" + queId);
        }
        

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void changeCategory(object sender, EventArgs e)
        {
            //Response.Write("hello selected");
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Doubt"].ConnectionString;
            string category = typeDoubt.SelectedItem.Value;
            //Response.Write(category);
            string cmd=null;
            if (category == "0")
            {
                cmd = "Select * from Doubts";
            }
            else
            {
                cmd = "Select * from Doubts where type=" + category;
            }
            try
            {
                using (con)
                {
                    SqlCommand command = new SqlCommand(cmd, con);
                    con.Open();
                   //Response.Write(cmd);
                    SqlDataReader reader = command.ExecuteReader();
                    string que_ = null;
                    while (reader.Read())
                    {
                        que_ = (string)reader["Question"];
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    }