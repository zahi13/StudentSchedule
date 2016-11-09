using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class ViewChores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * FROM Courses WHERE studentID = @studentID", con);

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

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            TableRow tr = new TableRow();

            TableCell td_choreID = new TableCell();
            td_choreID.Text = dr["ChoreID"].ToString();

            TableCell td_courseName = new TableCell();
            td_courseName.Text = dr["CourseName"].ToString();

            TableCell td_dueDate = new TableCell();
            td_dueDate.Text = Convert.ToDateTime(dr["DueDate"]).ToString("MMM.dd,yyyy");

            TableCell td_submittedDate = new TableCell();
            td_submittedDate.Text = Convert.ToDateTime(dr["Submitted"]).ToString("MMM.dd,yyyy");

            TableCell td_grade = new TableCell();
            td_grade.Text = dr["Grade"].ToString();

            tr.Cells.Add(td_choreID);
            tr.Cells.Add(td_courseName);
            tr.Cells.Add(td_dueDate);
            tr.Cells.Add(td_submittedDate);
            tr.Cells.Add(td_grade);

            viewChoresTable.Rows.Add(tr);
        }
    }
}