using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using Newtonsoft.Json;

/// <summary>
/// Summary description for testWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class testWebService : System.Web.Services.WebService
{

    public testWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string getJSON(int studentID)
    {
        //User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * FROM CoursesTime WHERE @studentID = studentID", con);

        cmd.Parameters.AddWithValue("@studentID", studentID);

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
        return json;


        //write string to file
        //TODO: change this before uploading to server
        //String FilePath;
        //FilePath = Server.MapPath("/json/events.json");
        ////File.WriteAllText(@"C:\Users\Zahi\Desktop\StudentSchedule\StudentSchedule\json\events.json", json);
        //File.WriteAllText(FilePath, json);
    }

}
