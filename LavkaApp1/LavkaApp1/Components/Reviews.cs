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
    
    public partial class Reviews
    {
        public int ReviewID { get; set; }
        public int UserID { get; set; }
        public Nullable<int> ServiceID { get; set; }
        public Nullable<int> MasterID { get; set; }
        public Nullable<int> Rating { get; set; }
        public string Comment { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
    
        public virtual Masters Masters { get; set; }
        public virtual Services Services { get; set; }
        public virtual Users Users { get; set; }
    }
}
