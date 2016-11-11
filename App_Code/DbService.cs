using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
/// <summary>
/// Summary description for DbService
/// </summary>
public class DbService
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ScheduleDB"].ConnectionString);
    SqlCommand cmd;


    public DbService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataSet GetDataSetByQuery(string sql, params SqlParameter[] p)
    {
        cmd = new SqlCommand(sql, con);

        foreach (SqlParameter s in p)
        {
            cmd.Parameters.AddWithValue(s.ParameterName, s.Value);
        }


        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        try
        {
            adp.Fill(ds);
        }
        catch
        {
            ds = null;
        }

        return ds;
        
    }

    public int ExecuteQuery(string sql, params  SqlParameter []  p)
    {
        int affected = 0;
        cmd = new SqlCommand(sql, con);


        foreach(SqlParameter s in p)
        {
            cmd.Parameters.AddWithValue(s.ParameterName, s.Value);
        }

        try
        {
            con.Open();
            affected = cmd.ExecuteNonQuery();
        }
        catch
        {
            affected = 0;
        }
        finally
        {
            con.Close();
        }


        return affected;
    }


    public object ExecuteScalar(string sql, params SqlParameter[] p)
    {
        object o = null;
        cmd = new SqlCommand(sql, con);


        foreach (SqlParameter s in p)
        {
            cmd.Parameters.AddWithValue(s.ParameterName, s.Value);
        }

        try
        {
            con.Open();
            o = cmd.ExecuteScalar();
        }
        catch
        {
            o = null;
        }
        finally
        {
            con.Close();
        }


        return o;
    }
}