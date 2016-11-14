using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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


        // To check condition on integer value
        //if (DataBinder.Eval(e.Row.DataItem, "Submitted") == null)
        //{
        //    e.Row.BackColor = System.Drawing.Color.Cyan;
        //}


        //e.Row.Attributes.Add("style", "cursor:help;");
        //if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Alternate)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='orange'");
        //        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#E56E94'");
        //        e.Row.BackColor = Color.FromName("#E56E94");
        //    }
        //}
        //else
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='orange'");
        //        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='gray'");
        //        e.Row.BackColor = Color.FromName("gray");
        //    }

        //    //e.Row.Cells[0].BackColor = Color.FromName("gray");
        //    //e.Row.Cells[1].BackColor = Color.FromName("gray");
        //    //e.Row.Cells[2].BackColor = Color.FromName("gray");
        //    //e.Row.Cells[3].BackColor = Color.FromName("gray");
        //    Response.Write("0 ->" + e.Row.Cells[0].Text);
        //    Response.Write("1 ->" + e.Row.Cells[1].Text);
        //    Response.Write("2 ->" + e.Row.Cells[2].Text);
        //    Response.Write("3 ->" + e.Row.Cells[3].Text);
        //    Response.Write("4 ->" + e.Row.Cells[4].Text);
        //    Response.Write("5 ->" + e.Row.Cells[5].Text);

        //    if (e.Row.Cells[4].Text == null)
        //    {
        //        e.Row.Cells[4].BackColor = Color.FromName("blue");
        //    }
        //    //e.Row.BorderWidth = 2;
        //    //e.Row.BorderColor = Color.FromName("#43C6DB");
        //}



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

    protected void fewChores_OnClick(object sender, EventArgs e)
    {
    }


    protected void DrugGridView_RowDataBound(object sender, GridViewRowEventArgs e)

    {

    }

}