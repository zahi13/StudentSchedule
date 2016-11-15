using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class CourseSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //User s = (User) Session["user"]; //Getting user info from session

        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        //SqlCommand cmd = new SqlCommand(@"SELECT * FROM CoursesTime WHERE @studentID = studentID", con);

        //cmd.Parameters.AddWithValue("@studentID", s.studentID);

        //int res = 0;
        //try
        //{
        //    con.Open(); //פתיחת חיבור בין האתר לבסיס נתונים
        //    res = cmd.ExecuteNonQuery(); //ביצוע השאילתא וקליטת הערך לתוך משתנה        
        //}
        //catch (Exception ex)
        //{
        //    res = 0; // Handle the error
        //}
        //finally
        //{
        //    con.Close(); //סגירת החיבור
        //}
    }




    protected void addCourseWindow_Click(object sender, EventArgs e)
    {
        string url = "AddCourseTime.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=500,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    protected void removeCourseWindow_Click(object sender, EventArgs e)
    {
        string url = "removeCourseTime.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=500,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }
}