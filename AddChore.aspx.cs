using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddChore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable subjects = new DataTable();
        using (
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString))
        {
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT courseName FROM Courses", con);
                adapter.Fill(subjects);
                dd_courseName.DataSource = subjects;
                dd_courseName.DataTextField = "courseName";
                dd_courseName.DataValueField = "courseName";
                dd_courseName.DataBind();
            }
            catch (Exception ex)
            {
                ; // Handle the error
            }
            finally
            {
                con.Close(); //סגירת החיבור
            }
        }

    }


    protected void SubmitChore(object sender, EventArgs e)
    {
        // User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);

        SqlCommand cmd = new SqlCommand(@"insert into Chores values(
                                            @studentID,
                                            @courseName,
                                            @dueDate,
                                            @Submitted,
                                            @grade)", con);

        cmd.Parameters.AddWithValue("@studentID", 1);
        cmd.Parameters.AddWithValue("@courseName", dd_courseName.Text);
        cmd.Parameters.AddWithValue("@dueDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@Submitted", DateTime.Now);
        cmd.Parameters.AddWithValue("@grade", txb_grade.Text);

        int res = 0;
        try
        {
            con.Open();    //פתיחת חיבור בין האתר לבסיס נתונים
            res = cmd.ExecuteNonQuery();  //ביצוע השאילתא וקליטת הערך לתוך משתנה        
        }
        catch (Exception ex)
        {
            res = 0; // Handle the error
        }
        finally
        {
            con.Close(); //סגירת החיבור
        }

        if (res > 0)
        {
            lbl_ChoreAdded.Text = "Chore was added successfully";
            lbl_ChoreAdded.ForeColor = Color.Green;
            //reset();

            //Response.Redirect("~/UploadReport.aspx");
        }
        else
        {
            lbl_ChoreAdded.Text = "Chore was NOT added";
            lbl_ChoreAdded.ForeColor = Color.Red;
        }

    }

    protected void reset()
    {
        dd_courseName.SelectedIndex = 0;
        txb_dueDate.Text = null;
        txb_submitted.Text = null;
        txb_grade.Text = null;
    }
}