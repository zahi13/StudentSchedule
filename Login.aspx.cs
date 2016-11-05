using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        User s = new User();
        s.getUser(studentID.Text);

        if (s.studentID == null)
        {
            labelMsg.Text = "שם משתמש שגוי";
        }
        else if (s.password == password.Text)
        {
            Session["user"] = s;
            Response.Redirect("~/WeeklySchedule.aspx");
        }
        else
        {
            labelMsg.Text = "סיסמא שגויה";
        }
        Session["user"] = null;
    }
}