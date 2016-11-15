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


    protected void viewChoresTable_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["Submitted"].ToString().Equals("") || drv["grade"].ToString().Equals(""))
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

    }

    protected void fewChores_OnClick(object sender, EventArgs e)
    {
    }


    protected void DrugGridView_RowDataBound(object sender, GridViewRowEventArgs e)

    {

    }

}