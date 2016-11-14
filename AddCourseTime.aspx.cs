using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCourseTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSaveCoursesTime_OnClick(object sender, EventArgs e)
    {
        User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);

        SqlCommand cmd = new SqlCommand(@"INSERT into CoursesTime values(
                                            @courseName,
                                            @startTime,
                                            @endTime,
                                            @studentID)", con);

        string dateTime = datePicker.Text;
        DateTime dt = Convert.ToDateTime(dateTime);
        dt = dt.AddDays(1);
        TimeSpan time;
        DateTime combinedStart = DateTime.Now;
        DateTime combinedEnd = DateTime.Now;

        if (TimeSpan.TryParse(ddl_StartTime.SelectedItem.Text, out time))
        {
            // calendarDate is the DateTime value of the calendar control
            combinedStart = dt.Add(time);
        }

        if (TimeSpan.TryParse(ddl_EndTime.SelectedItem.Text, out time))
        {
            // calendarDate is the DateTime value of the calendar control
            combinedEnd = dt.Add(time);
        }


        cmd.Parameters.AddWithValue("@courseName", ddlCourseTime.Text);
        cmd.Parameters.AddWithValue("@startTime", combinedStart);
        cmd.Parameters.AddWithValue("@endTime", combinedEnd);
        cmd.Parameters.AddWithValue("@studentID", s.studentID);

        int res = 0;
        try
        {
            con.Open(); //פתיחת חיבור בין האתר לבסיס נתונים
            res = cmd.ExecuteNonQuery(); //ביצוע השאילתא וקליטת הערך לתוך משתנה        
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
            lblSaveCourseTime.Text = "הקורס נוסף בהצלחה";
            lblSaveCourseTime.ForeColor = Color.Green;
        }
        else
        {
            lblSaveCourseTime.Text = "הקורס לא נוסף";
            lblSaveCourseTime.ForeColor = Color.Red;
        }
    }
}