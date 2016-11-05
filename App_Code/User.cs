using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class User
{
    public string studentID;
    public string fullName;
    public string password;
    public string listedCourses;

    public void getUser(string studentID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * from Students
                                        where studentID = @studentID
                                        ", con);

        cmd.Parameters.AddWithValue("@studentID", studentID);

        DataSet ds = new DataSet();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        try
        {
            adp.Fill(ds);  //פונקצייה שתפתח את הקשר לבסיס נתונים תמלא את מערך הטבלאות ותסגור את הקשר
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                this.studentID = dr["studentID"].ToString();
                this.fullName = dr["fullName"].ToString();
                this.password = dr["password"].ToString();
                this.listedCourses = dr["listedCourses"].ToString();
            }
        }
        catch
        {
            //do something with the error
            ds = null;
            //User not found
            this.studentID = "-1";
        }
    }
}