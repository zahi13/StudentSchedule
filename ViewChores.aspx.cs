using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
}