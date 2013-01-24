using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace BusinessLogicBS.ServiceClasses
{
    public class Area
    {

        public int ID { get; set; }
        public string AreaName { get; set; }
        public string value { get; set; }



        public List<Area> GetAreaList()
        {
            InterfacesBS.InterfacesDA.IArea area = new DataAccessBS.ItemClasses.Area();




            DataTable dt = area.GetArea(1);
            List<Area> list = new List<Area>();
            int cnt = dt.Rows.Count;
            for (int i = 0; i < cnt; i++)
            {
                // ProjectActivity prj = new ProjectActivity();
                Area prj = new Area();

                prj.ID = int.Parse(dt.Rows[i]["AREA_ID"].ToString());
                prj.AreaName = dt.Rows[i]["AREA_SHORT"].ToString();
                prj.value = dt.Rows[i]["AREA_SHORT"].ToString();
                //prj.ActualHours = int.Parse(dt.Rows[i]["ActualHours"].ToString());

                list.Add(prj);

            }

            return list.ToList();
        }


    }

}


