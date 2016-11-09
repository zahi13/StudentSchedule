using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class AddChore : System.Web.UI.Page
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
    }


    protected void SubmitChore(object sender, EventArgs e)
    {
        if (CheckInputFields())
        {
            User s = (User)Session["user"]; //Getting user info from session

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);

            SqlCommand cmd = new SqlCommand(@"insert into Chores values(
                                            @studentID,
                                            @courseName,
                                            @dueDate,
                                            @Submitted,
                                            @grade,
                                            @choreNum)", con);

            cmd.Parameters.AddWithValue("@studentID", s.studentID);
            cmd.Parameters.AddWithValue("@courseName", dd_courseName.Text);
            cmd.Parameters.AddWithValue("@dueDate", txb_dueDate.Text);
            cmd.Parameters.AddWithValue("@Submitted", txb_submitted.Text);
            cmd.Parameters.AddWithValue("@choreNum", txb_choreNum.Text);

            cmd.Parameters.AddWithValue("@grade", txb_grade.Text);

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
                lbl_ChoreAdded.Text = "המטלה נוספה בהצלחה";
                lbl_ChoreAdded.ForeColor = Color.Green;
                ResetInputFields();
            }
            else
            {
                lbl_ChoreAdded.Text = "המטלה לא נוספה";
                lbl_ChoreAdded.ForeColor = Color.Red;
            }
        }

    }

    protected void ResetInputFields()
    {
        dd_courseName.SelectedIndex = 0;
        txb_dueDate.Text = null;
        txb_submitted.Text = null;
        txb_grade.Text = null;
    }

    private bool CheckInputFields()
    {
        bool flag = true;

        if (dd_courseName.Text == "0")
            flag = false;
        if (txb_dueDate.Text == "")
            flag = false;
        if (txb_choreNum.Text == "")
            flag = false;

        if (flag == false)
        {
            lbl_ChoreAdded.Text =" נא למלא שם קורס /תאריך הגשה";
            lbl_ChoreAdded.ForeColor = Color.Red;
            return flag;
        }
        return flag;
    }
}