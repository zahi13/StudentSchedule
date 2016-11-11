using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewChores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addChoreWindow_Click(object sender, EventArgs e)
    {
        string url = "AddChore.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=500,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }


//    void fixDatesToNullInDB()
//    {
//        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
//        SqlCommand cmd = new SqlCommand("UPDATE Chores SET Submitted = null WHERE Submitted = '1900-01-01'", con);

//        int res = 0;
//        try
//        {
//            con.Open(); //פתיחת חיבור בין האתר לבסיס נתונים
//            res = cmd.ExecuteNonQuery(); //ביצוע השאילתא וקליטת הערך לתוך משתנה        
//        }
//        catch (Exception ex)
//        {
//            res = 0; // Handle the error
//        }
//        finally
//        {
//            con.Close(); //סגירת החיבור
//        }

//    }

protected void ViewAllChores_OnClick(object sender, EventArgs e)
{
    throw new NotImplementedException();
}

    protected void viewChoresTable_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // אם לא הוגשה עדין המטלה צבע את השורה באדום, אחרת השאר בירוק
            //if (Convert.ToInt32(e.Row.Cells[2].Text) < 60)
            //{
            //    e.Row.BackColor = System.Drawing.Color.Red;
            //}

        }
    }

    protected void fewChores_OnClick(object sender, EventArgs e)
    {
        throw new NotImplementedException();
    }

}