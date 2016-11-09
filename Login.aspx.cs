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
        s.getUser(tb_user_name.Text);

        if (s.studentID == null)
        {
            lbl_confirm.Text = "שם משתמש שגוי";
            lbl_confirm.ForeColor = System.Drawing.Color.Red;
        }
        else if (s.password == tb_password.Text)
        {
            Session["user"] = s;
            Response.Redirect("~/ViewChores.aspx");
        }
        else
        {
            lbl_confirm.Text = "סיסמא שגויה";
            lbl_confirm.ForeColor = System.Drawing.Color.Red;
        }
        Session["user"] = null;
    }
    protected void password_TextChanged(object sender, EventArgs e)
    {

    }
}