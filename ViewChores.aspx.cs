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

public partial class ViewChores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       showAll();
    }

    protected void addChoreWindow_Click(object sender, EventArgs e)
    {
        string url = "AddChore.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=500,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    protected void viewChoresTable_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["Submitted"].ToString().Equals(""))
            {
                e.Row.BackColor = System.Drawing.Color.AntiqueWhite;
            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.PaleGreen;
            }
        }
    }

    protected void ViewAllChores_OnClick(object sender, EventArgs e)
    {
        showAll();
    }

    protected void fewChores_OnClick(object sender, EventArgs e)
    {
        User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT TOP 5 * FROM Chores WHERE @studentID = studentID ORDER BY dueDate DESC", con);

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

        //viewChoresTable.ReadOnly = true;
        viewChoresTable.DataSource = ds.Tables[0];
        viewChoresTable.DataBind();
    }

    private void showAll()
    {
        User s = (User)Session["user"]; //Getting user info from session

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * FROM Chores WHERE @studentID = studentID", con);

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

        //viewChoresTable.ReadOnly = true;
        viewChoresTable.DataSource = ds.Tables[0];
        viewChoresTable.DataBind();

    }


    protected void DrugGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

}