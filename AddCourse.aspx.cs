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

public partial class AddCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable subjects = new DataTable();
            using (
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT year FROM Year", con);
                    adapter.Fill(subjects);
                    dd_year.DataSource = subjects;
                    dd_year.DataTextField = "year";
                    dd_year.DataValueField = "year";
                    dd_year.DataBind();
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
    }

    protected void submitCourses(object sender, EventArgs e)
    {
        if (CheckInputFields())
        {
            // User s = (User)Session["user"]; //Getting user info from session

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);

            SqlCommand cmd = new SqlCommand(@"insert into Courses values(
                                            @courseName,
                                            @Semester,
                                            @Year,
                                            @TestA,
                                            @TestB,
                                            @TeacherName,
                                            @TeacherEmail,
                                            @TeacherPhone)", con);

            cmd.Parameters.AddWithValue("@courseName", tbCourseName.Text);
            cmd.Parameters.AddWithValue("@Semester", tbSemester.Text);
            cmd.Parameters.AddWithValue("@Year", dd_year.Text);
            cmd.Parameters.AddWithValue("@TestA", tbTestA.Text);
            cmd.Parameters.AddWithValue("@TestB", tbTestB.Text);
            cmd.Parameters.AddWithValue("@TeacherName", tbTeacherName.Text);
            cmd.Parameters.AddWithValue("@TeacherEmail", tbTeacherEmail.Text);
            cmd.Parameters.AddWithValue("@TeacherPhone", tbTeacherPhone.Text);

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
                lbCourseAdded.Text = "Course was added successfully";
                lbCourseAdded.ForeColor = Color.Green;
            }
            else
            {
                lbCourseAdded.Text = "Course was NOT added";
                lbCourseAdded.ForeColor = Color.Red;
            }
        }
    }

    private bool CheckInputFields()
    {
        bool flag = true;

        if (tbCourseName.Text == "")
            flag = false;
        if (tbSemester.Text == "")
            flag = false;
        if (dd_year.Text == "")
            flag = false;       
        if (tbTestA.Text == "")
            flag = false;
        if (tbTestB.Text == "")
            flag = false;
        if (tbTeacherName.Text == "")
            flag = false;
        if (tbTeacherEmail.Text == "")
            flag = false;
        if (tbTeacherPhone.Text == "")
            flag = false;

        if (flag == false)
        {
            lbCourseAdded.Text = "Some input fields are empty";
            lbCourseAdded.ForeColor = Color.Red;
            return flag;
        }
        return flag;
    }
}