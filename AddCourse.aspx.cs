using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitCourses(object sender, EventArgs e)
    {
        // User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);

        SqlCommand cmd = new SqlCommand(@"insert into Courses values(
                                            @courseName,
                                            @Semester,
                                            @Year,
                                            @startDate,
                                            @endDate,
                                            @TestA,
                                            @TestB,
                                            @TeacherName,
                                            @TeacherEmail,
                                            @TeacherPhone)", con);

        cmd.Parameters.AddWithValue("@courseName", tbCourseName.Text);
        cmd.Parameters.AddWithValue("@Semester", tbSemester.Text);
        cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year);
        cmd.Parameters.AddWithValue("@startDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@endDate", DateTime.Now); 
        cmd.Parameters.AddWithValue("@TestA", DateTime.Now);
        cmd.Parameters.AddWithValue("@TestB", DateTime.Now);
        cmd.Parameters.AddWithValue("@TeacherName", tbTeacherName.Text);
        cmd.Parameters.AddWithValue("@TeacherEmail", tbTeacherEmail.Text);
        cmd.Parameters.AddWithValue("@TeacherPhone", tbTeacherPhone.Text);

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
            lbCourseAdded.Text = "Course was added successfully";
            //Response.Redirect("~/UploadReport.aspx");
        }
        else
        {
            lbCourseAdded.Text = "Course was NOT added";
        }
    }
}