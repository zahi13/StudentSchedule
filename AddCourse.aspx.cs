﻿using System;
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
            cmd.Parameters.AddWithValue("@Semester", ddl_Semester.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Year", ddl_year.SelectedItem.Text);
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
                lbCourseAdded.Text = "הקורס נוסף בהצלחה";
                lbCourseAdded.ForeColor = Color.Green;
            }
            else
            {
                lbCourseAdded.Text = "הקורס לא נוסף";
                lbCourseAdded.ForeColor = Color.Red;
            }
        }
    }

    private bool CheckInputFields()
    {
        bool flag = true;

        if (tbCourseName.Text == "")
            flag = false;
        if (ddl_Semester.Text == "")
            flag = false;
        if (ddl_year.Text == "")
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
            lbCourseAdded.Text = "נא למלא את השדות הריקים";
            lbCourseAdded.ForeColor = Color.Red;
            return flag;
        }
        return flag;
    }
}