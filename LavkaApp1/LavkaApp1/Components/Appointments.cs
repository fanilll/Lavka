//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LavkaApp1.Components
{
    using System;
    using System.Collections.Generic;
    
    public partial class Appointments
    {
        public int AppointmentID { get; set; }
        public int UserID { get; set; }
        public int ServiceID { get; set; }
        public int MasterID { get; set; }
        public System.DateTime AppointmentDate { get; set; }
        public string QueueNumber { get; set; }
        public string Status { get; set; }
    
        public virtual Masters Masters { get; set; }
        public virtual Services Services { get; set; }
        public virtual Users Users { get; set; }
    }
}
