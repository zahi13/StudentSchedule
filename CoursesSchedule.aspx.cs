using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class CourseSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User s = (User) Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * FROM CoursesTime WHERE @studentID = studentID", con);

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


        DataSet ds = new DataSet();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        try
        {
            adp.Fill(ds); //פונקצייה שתפתח את הקשר לבסיס נתונים תמלא את מערך הטבלאות ותסגור את הקשר
        }
        catch
        {
            //do something with the error
            ds = null;
        }

        List<Course> _data = new List<Course>();
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            _data.Add(new Course()
            {
                title = dr["courseName"].ToString(),
                start = dr["startTime"].ToString(),
                end = dr["endTime"].ToString()
            });
        }

        string json = JsonConvert.SerializeObject(_data.ToArray());
        //Session["CoursesTime"] = json;
        //var obj = JSON.parse(sessionStorage.getItem('CoursesTime')); // An object :D



        //write string to file
        //TODO: change this before uploading to server
        String FilePath;
        FilePath = Server.MapPath("/json/events.json");
        //File.WriteAllText(@"C:\Users\Zahi\Desktop\StudentSchedule\StudentSchedule\json\events.json", json);
        File.WriteAllText(FilePath, json);








        //TableRow tr = new TableRow();

        //TableCell tbCourseName = new TableCell();
        //tbCourseName.Text = dr["CourseName"].ToString();

        //TableCell tbSemester = new TableCell();
        //tbSemester.Text = dr["semester"].ToString();

        //TableCell tbYear = new TableCell();
        //tbYear.Text = dr["year"].ToString();

        //TableCell tbTestA = new TableCell();
        //tbTestA.Text = Convert.ToDateTime(dr["testA"]).ToString("MMM.dd,yyyy");

        //TableCell tbTestB = new TableCell();
        //tbTestB.Text = Convert.ToDateTime(dr["testB"]).ToString("MMM.dd,yyyy");

        //TableCell tbTeacherName = new TableCell();
        //tbTeacherName.Text = dr["teacherName"].ToString();

        //TableCell tbTeacherEmail = new TableCell();
        //tbTeacherEmail.Text = dr["teacherEmail"].ToString();

        //TableCell tbTeacherPhone = new TableCell();
        //tbTeacherPhone.Text = dr["teacherPhone"].ToString();

        //tr.Cells.Add(tbCourseName);
        //tr.Cells.Add(tbSemester);
        //tr.Cells.Add(tbYear);
        //tr.Cells.Add(tbTestA);
        //tr.Cells.Add(tbTestB);
        //tr.Cells.Add(tbTeacherName);
        //tr.Cells.Add(tbTeacherEmail);
        //tr.Cells.Add(tbTeacherPhone);

        //ViewCoursesTable.Rows.Add(tr);


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